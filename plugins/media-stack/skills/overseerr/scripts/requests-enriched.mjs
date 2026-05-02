import { overseerrFetch, parseArgs, printJson, toInt } from './lib.mjs';

function usage() {
  process.stderr.write(
    [
      'Usage:',
      '  node requests-enriched.mjs [--filter all|approved|available|pending|processing|unavailable|failed|deleted|completed] [--limit N] [--skip N] [--sort added|modified] [--requestedBy USER_ID]',
      '',
      'Returns requests with titles resolved from TMDB metadata.',
      '',
    ].join('\n')
  );
}

const args = parseArgs(process.argv.slice(2));
if (args.help) {
  usage();
  process.exit(0);
}

const take = args.limit ? toInt(args.limit, { name: 'limit' }) : 20;
const skip = args.skip ? toInt(args.skip, { name: 'skip' }) : 0;

// Fetch requests
const data = await overseerrFetch('/request', {
  query: {
    take,
    skip,
    filter: args.filter,
    sort: args.sort,
    requestedBy: args.requestedBy ? toInt(args.requestedBy, { name: 'requestedBy' }) : undefined,
  },
});

// Status code mapping
const STATUS_MAP = {
  1: 'Pending',
  2: 'Approved', 
  3: 'Declined',
  4: 'Available',
  5: 'Processing',
};

function getStatusLabel(status) {
  return STATUS_MAP[status] || `Unknown (${status})`;
}

// Enrich each request with title from media endpoint
async function enrichRequest(request) {
  const { media, type } = request;
  const tmdbId = media?.tmdbId;
  
  if (!tmdbId) {
    return { ...request, _title: 'Unknown', _statusLabel: getStatusLabel(request.status) };
  }

  try {
    let title = 'Unknown';
    if (type === 'movie') {
      const movieData = await overseerrFetch(`/movie/${tmdbId}`);
      title = movieData.title || movieData.originalTitle || 'Unknown';
    } else if (type === 'tv') {
      const tvData = await overseerrFetch(`/tv/${tmdbId}`);
      title = tvData.name || tvData.originalName || 'Unknown';
    }
    
    return { 
      ...request, 
      _title: title, 
      _statusLabel: getStatusLabel(request.status) 
    };
  } catch (err) {
    // Fallback if media fetch fails
    return { 
      ...request, 
      _title: `ID ${tmdbId}`, 
      _statusLabel: getStatusLabel(request.status) 
    };
  }
}

// Enrich all requests in parallel (with concurrency limit)
async function enrichAll(requests, concurrency = 5) {
  const results = [];
  for (let i = 0; i < requests.length; i += concurrency) {
    const batch = requests.slice(i, i + concurrency);
    const enriched = await Promise.all(batch.map(enrichRequest));
    results.push(...enriched);
  }
  return results;
}

// Enrich results
if (data.results && data.results.length > 0) {
  data.results = await enrichAll(data.results);
}

printJson(data);
