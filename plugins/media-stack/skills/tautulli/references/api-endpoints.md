# Tautulli API Endpoints Reference

Complete reference for all Tautulli API v2 endpoints used in this skill.

## API Base URL

```
http://<your_tautulli_url>/api/v2?apikey=<your_api_key>&cmd=COMMAND&param=value
```

All requests are GET requests with parameters in the query string.

## Authentication

Add `apikey=<your_api_key>` to all requests. The API key is found in:
- Settings → Web Interface → API → API Key

## Response Format

Default format is JSON. All responses follow this structure:

```json
{
  "response": {
    "result": "success",
    "message": null,
    "data": { ... }
  }
}
```

**Success response:**
- `result`: "success"
- `data`: Response data (varies by endpoint)
- `message`: null or informational message

**Error response:**
- `result`: "error"
- `message`: Error description
- `data`: null or error details

## Server Information

### get_server_info

Get Tautulli server information and version.

**Endpoint:** `cmd=get_server_info`

**Parameters:** None

**Response:**
```json
{
  "response": {
    "result": "success",
    "data": {
      "tautulli_version": "2.13.4",
      "pms_identifier": "abc123...",
      "pms_name": "MyPlexServer",
      "pms_version": "1.32.5.7349",
      "pms_platform": "Linux",
      "pms_ip": "192.168.1.100",
      "pms_port": "32400",
      "pms_is_remote": 0,
      "pms_ssl": 0
    }
  }
}
```

## Activity & Sessions

### get_activity

Get current Plex Media Server activity with session details.

**Endpoint:** `cmd=get_activity`

**Parameters:** None

**Response:**
```json
{
  "response": {
    "result": "success",
    "data": {
      "stream_count": "2",
      "stream_count_direct_play": 1,
      "stream_count_direct_stream": 0,
      "stream_count_transcode": 1,
      "total_bandwidth": 12500,
      "lan_bandwidth": 8000,
      "wan_bandwidth": 4500,
      "sessions": [
        {
          "session_key": "123",
          "session_id": "abc123",
          "media_type": "movie",
          "user": "john",
          "friendly_name": "John Smith",
          "full_title": "Inception (2010)",
          "title": "Inception",
          "year": "2010",
          "rating_key": "12345",
          "parent_rating_key": "",
          "grandparent_rating_key": "",
          "player": "Plex Web",
          "product": "Plex Web",
          "platform": "Chrome",
          "device": "PC",
          "location": "lan",
          "quality_profile": "Original",
          "stream_container": "mkv",
          "stream_video_codec": "h264",
          "stream_audio_codec": "aac",
          "transcode_decision": "direct play",
          "video_decision": "direct play",
          "audio_decision": "direct play",
          "bandwidth": 8000,
          "progress_percent": 45,
          "view_offset": 2700000,
          "duration": 6000000
        }
      ]
    }
  }
}
```

## History

### get_history

Get playback history with detailed filtering.

**Endpoint:** `cmd=get_history`

**Parameters:**
- `user` (string): Filter by username
- `user_id` (int): Filter by user ID
- `section_id` (int): Filter by library section
- `media_type` (string): movie, episode, track, photo
- `rating_key` (int): Filter by specific media item
- `start_date` (timestamp): History after this date (Unix timestamp)
- `before` (timestamp): History before this date (Unix timestamp)
- `search` (string): Search in titles
- `order_column` (string): Sort column (date, friendly_name, full_title, etc.)
- `order_dir` (string): desc or asc
- `start` (int): Pagination offset (default: 0)
- `length` (int): Number of results (default: 25)

**Response:**
```json
{
  "response": {
    "result": "success",
    "data": {
      "recordsFiltered": 1234,
      "recordsTotal": 1234,
      "draw": 1,
      "data": [
        {
          "date": 1704156789,
          "friendly_name": "John Smith",
          "user": "john",
          "user_id": 123456,
          "media_type": "movie",
          "rating_key": "12345",
          "parent_rating_key": "",
          "grandparent_rating_key": "",
          "full_title": "Inception (2010)",
          "title": "Inception",
          "year": "2010",
          "section_id": 1,
          "library_name": "Movies",
          "player": "Plex Web",
          "platform": "Chrome",
          "product": "Plex Web",
          "quality_profile": "Original",
          "stream_video_codec": "h264",
          "stream_audio_codec": "aac",
          "transcode_decision": "direct play",
          "percent_complete": 98,
          "watched_status": 1,
          "started": 1704150000,
          "stopped": 1704156789,
          "duration": 6789,
          "paused_counter": 2,
          "ip_address": "192.168.1.50"
        }
      ]
    }
  }
}
```

## User Statistics

### get_users

Get list of all users with basic statistics.

**Endpoint:** `cmd=get_users`

**Parameters:** None

**Response:**
```json
{
  "response": {
    "result": "success",
    "data": [
      {
        "user_id": 123456,
        "username": "john",
        "friendly_name": "John Smith",
        "email": "john@example.com",
        "thumb": "/path/to/avatar.jpg",
        "is_home_user": 1,
        "is_allow_sync": 1,
        "is_restricted": 0,
        "do_notify": 1,
        "keep_history": 1,
        "deleted_user": 0,
        "allow_guest": 0,
        "user_thumb": "/path/to/thumb.jpg",
        "last_seen": 1704156789,
        "ip_address": "192.168.1.50",
        "plays": 1234,
        "duration": 456789
      }
    ]
  }
}
```

### get_user_stats

Get detailed statistics for a specific user.

**Endpoint:** `cmd=get_user_stats`

**Parameters:**
- `user` (string): Username (optional, omit for all users)
- `user_id` (int): User ID (alternative to user)
- `start_date` (timestamp): Stats after this date
- `order_column` (string): Sort column (plays, duration, last_seen)
- `order_dir` (string): desc or asc
- `length` (int): Number of results

**Response:** Similar to get_users but with more detailed breakdowns by media type.

## Library Information

### get_libraries

Get all library sections.

**Endpoint:** `cmd=get_libraries`

**Parameters:** None

**Response:**
```json
{
  "response": {
    "result": "success",
    "data": [
      {
        "section_id": "1",
        "section_name": "Movies",
        "section_type": "movie",
        "thumb": "/path/to/thumb.jpg",
        "art": "/path/to/art.jpg",
        "count": 1234,
        "parent_count": 0,
        "child_count": 0,
        "is_active": 1,
        "do_notify": 1,
        "do_notify_created": 1,
        "keep_history": 1
      }
    ]
  }
}
```

### get_library

Get detailed statistics for a specific library section.

**Endpoint:** `cmd=get_library`

**Parameters:**
- `section_id` (int, required): Library section ID

**Response:**
```json
{
  "response": {
    "result": "success",
    "data": {
      "section_id": "1",
      "section_name": "Movies",
      "section_type": "movie",
      "count": 1234,
      "child_count": 0,
      "parent_count": 0,
      "plays": 5678,
      "duration": 1234567,
      "last_accessed": 1704156789,
      "last_played": "Inception (2010)",
      "library_art": "/path/to/art.jpg",
      "library_thumb": "/path/to/thumb.jpg"
    }
  }
}
```

## Media Information

### get_recently_added

Get recently added media items.

**Endpoint:** `cmd=get_recently_added`

**Parameters:**
- `count` (int): Number of results (default: 25)
- `start` (int): Pagination offset
- `section_id` (int): Filter by library section
- `media_type` (string): movie, show, artist

**Response:**
```json
{
  "response": {
    "result": "success",
    "data": {
      "recently_added": [
        {
          "added_at": "1704156789",
          "media_type": "movie",
          "section_id": "1",
          "library_name": "Movies",
          "rating_key": "12345",
          "parent_rating_key": "",
          "grandparent_rating_key": "",
          "title": "Dune",
          "year": "2021",
          "thumb": "/library/metadata/12345/thumb/...",
          "parent_thumb": "",
          "grandparent_thumb": "",
          "art": "/library/metadata/12345/art/...",
          "originally_available_at": "2021-10-22",
          "guid": "plex://movie/5d77...",
          "content_rating": "PG-13",
          "summary": "Feature adaptation of Frank Herbert's science fiction novel...",
          "tagline": "",
          "rating": "8.0",
          "duration": 9360000,
          "file": "/path/to/movie.mkv",
          "container": "mkv",
          "bitrate": 15000,
          "video_codec": "hevc",
          "video_resolution": "1080",
          "video_framerate": "24p",
          "audio_codec": "aac",
          "audio_channels": "5.1"
        }
      ]
    }
  }
}
```

### get_metadata

Get detailed metadata for a specific media item.

**Endpoint:** `cmd=get_metadata`

**Parameters:**
- `rating_key` (int): Plex rating key (required if no guid)
- `guid` (string): Plex GUID (required if no rating_key)

**Response:** Extensive metadata including cast, genres, technical details, etc.

## Statistics & Analytics

### get_home_stats

Get homepage statistics (overview dashboard data).

**Endpoint:** `cmd=get_home_stats`

**Parameters:**
- `time_range` (int): Days to include (default: 30)
- `stats_type` (string): plays or duration
- `stat_id` (string): Specific stat (popular_movies, popular_tv, popular_music)

**Response:**
```json
{
  "response": {
    "result": "success",
    "data": [
      {
        "stat_id": "popular_movies",
        "stat_type": "popular",
        "stat_title": "Most Popular Movies",
        "rows": [
          {
            "title": "Inception",
            "total_plays": 45,
            "total_duration": 123456,
            "users_watched": "John, Jane, Bob",
            "rating_key": "12345",
            "grandparent_thumb": "",
            "thumb": "/library/metadata/12345/thumb/...",
            "art": "/library/metadata/12345/art/...",
            "section_id": 1,
            "media_type": "movie",
            "content_rating": "PG-13",
            "labels": [],
            "user": "",
            "friendly_name": "",
            "platform": "",
            "row_id": 12345,
            "year": "2010"
          }
        ]
      }
    ]
  }
}
```

### get_plays_by_date

Get plays grouped by date.

**Endpoint:** `cmd=get_plays_by_date`

**Parameters:**
- `time_range` (int): Days to include (default: 30)
- `y_axis` (string): plays or duration
- `user_id` (int): Filter by user
- `grouping` (int): Grouping level (0=day, 1=week, 2=month)

**Response:**
```json
{
  "response": {
    "result": "success",
    "data": {
      "categories": ["2024-01-01", "2024-01-02", "2024-01-03"],
      "series": [
        {
          "name": "TV",
          "data": [12, 15, 18]
        },
        {
          "name": "Movies",
          "data": [8, 10, 7]
        },
        {
          "name": "Music",
          "data": [45, 50, 42]
        }
      ]
    }
  }
}
```

### get_plays_by_hourofday

Get plays grouped by hour of day.

**Endpoint:** `cmd=get_plays_by_hourofday`

**Parameters:**
- `time_range` (int): Days to include (default: 30)
- `y_axis` (string): plays or duration
- `user_id` (int): Filter by user

**Response:** Similar to get_plays_by_date with hours 0-23 as categories.

### get_plays_by_dayofweek

Get plays grouped by day of week.

**Endpoint:** `cmd=get_plays_by_dayofweek`

**Parameters:**
- `time_range` (int): Days to include (default: 30)
- `y_axis` (string): plays or duration
- `user_id` (int): Filter by user

**Response:** Similar to get_plays_by_date with days (Mon-Sun) as categories.

### get_plays_by_stream_type

Get plays grouped by stream type (direct play, direct stream, transcode).

**Endpoint:** `cmd=get_plays_by_stream_type`

**Parameters:**
- `time_range` (int): Days to include (default: 30)
- `y_axis` (string): plays or duration
- `user_id` (int): Filter by user

**Response:**
```json
{
  "response": {
    "result": "success",
    "data": {
      "categories": ["Direct Play", "Direct Stream", "Transcode"],
      "series": [
        {
          "name": "TV",
          "data": [120, 30, 15]
        },
        {
          "name": "Movies",
          "data": [80, 10, 5]
        }
      ]
    }
  }
}
```

### get_plays_by_top_10_platforms

Get plays by top platforms/devices.

**Endpoint:** `cmd=get_plays_by_top_10_platforms`

**Parameters:**
- `time_range` (int): Days to include (default: 30)
- `y_axis` (string): plays or duration
- `user_id` (int): Filter by user

**Response:**
```json
{
  "response": {
    "result": "success",
    "data": {
      "categories": ["Plex Web", "Roku", "Apple TV", "iOS", "Android"],
      "series": [
        {
          "name": "Plays",
          "data": [120, 89, 67, 45, 23]
        }
      ]
    }
  }
}
```

### get_concurrent_streams_by_stream_type

Get concurrent stream counts over time by stream type.

**Endpoint:** `cmd=get_concurrent_streams_by_stream_type`

**Parameters:**
- `time_range` (int): Days to include (default: 30)
- `y_axis` (string): concurrent
- `user_id` (int): Filter by user

**Response:** Time series data showing concurrent stream counts.

## Common Parameters

Most endpoints support these standard parameters:

- `out_type` (string): json or xml (default: json)
- `order_column` (string): Column to sort by
- `order_dir` (string): desc or asc (default: desc)
- `start` (int): Pagination offset (default: 0)
- `length` (int): Number of results (default: 25)
- `user_id` (int): Filter by user ID
- `section_id` (int): Filter by library section ID
- `time_range` (int): Days to include in statistics
- `callback` (string): JSONP callback function
- `debug` (bool): Include debug information

## Error Responses

When an error occurs, the response will have `result: "error"`:

```json
{
  "response": {
    "result": "error",
    "message": "Invalid apikey",
    "data": null
  }
}
```

Common errors:
- `Invalid apikey`: API key is wrong or missing
- `Invalid parameter`: Required parameter missing or invalid
- `No section_id provided`: Library section ID required but not provided
- `Failed to retrieve data`: Database or Plex server error

## Rate Limiting

Tautulli doesn't enforce rate limits by default, but:
- Avoid excessive polling (recommended: max 1 req/second)
- Use reasonable time ranges for statistics
- Cache results where appropriate
- Use pagination for large result sets

## Best Practices

1. **Always check `result` field** before processing data
2. **Handle missing data gracefully** (null values, empty arrays)
3. **Use specific filters** to reduce response size
4. **Cache frequently accessed data** (library list, user list)
5. **Use pagination** for history queries
6. **Reasonable time ranges** for statistics (7-30 days typically)
7. **URL encode parameters** especially search queries
8. **Check Tautulli version** for feature availability

## Reference

- [Official Tautulli API Documentation](https://github.com/Tautulli/Tautulli/wiki/Tautulli-API-Reference)
- [Tautulli GitHub](https://github.com/Tautulli/Tautulli)
