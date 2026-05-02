Metadata Provider Identifiers | Jellyfin
[Skip to main content](#__docusaurus_skipToContent_fallback)
On this page
To improve the accuracy of media identification, you can manually specify a metadata provider identifier for each movie or show. Each metadata provider uses a unique identifier for its content, and adding these identifiers greatly improves media identification. Identifiers can be specified in your movie/show file or folder name. Multiple identifiers can be specified. For example:
```
`
Movies
├── Best\_Movie\_Ever (1994) [tmdbid-680] [imdbid-1234]
│ ├── Best\_Movie\_Ever (1994) [tmdbid-680].mp4
└── Movie (2021) [imdbid-tt12801262]
└── Movie (2021) [imdbid-tt12801262].mp4
Shows
└── Series Name (2018) [tvdbid-79168]
├── Season 01
| ├── Series Name B S01E01.mkv
| └── Series Name B S01E02.mkv
└── Season 02
├── Series Name B S02E01-E02.mkv
└── Series Name B S02E03.mkv
`
```
## Supported Metadata Providers[​](#supported-metadata-providers)
The following metadata providers are supported:
* [The Movie DB (TMDB)](https://www.themoviedb.org/)
* [The TV Database (TVDB)](https://www.thetvdb.com/) (Shows Only)
* [OMDb API (OMDB)](https://www.omdbapi.com/) (English Only)
## Finding Metadata Provider Identifiers[​](#finding-metadata-provider-identifiers)
Below are instructions on how to find metadata provider identifiers for each supported provider.
### The Movie Database (TMDB)[​](#the-movie-database-tmdb)
The identifier is found in the URL of the title. For example:
URL: `https://www.themoviedb.org/movie/569094-spider-man-across-the-spider-verse`
Identifier: `[tmdbid-569094]`
### The TV Database (TVDB)[​](#the-tv-database-tvdb)
The identifier is found on the main page of the title. For example:
Identifier: `[tvdbid-266189]`
### OMDb API (OMDB)[​](#omdb-api-omdb)
OMDB provider uses Internet Movie Database (IMDB) IDs as identifiers. The identifier is found in the URL of the title. For example:
URL: `https://www.imdb.com/title/tt9362722/`
Identifier: `[imdbid-tt9362722]`
* [Supported Metadata Providers](#supported-metadata-providers)
* [Finding Metadata Provider Identifiers](#finding-metadata-provider-identifiers)
* [The Movie Database (TMDB)](#the-movie-database-tmdb)
* [The TV Database (TVDB)](#the-tv-database-tvdb)
* [OMDb API (OMDB)](#omdb-api-omdb)