Plex API: Get a Movie - Plexopedia
[ Buy me a coffee](https://buymeacoffee.com/plexopedia)
This API command will return all metadata from the Plex server for a specific movie.
## URL
```
GET http://{ip\_address}:32400/library/metadata/{id}?X-Plex-Token={plex\_token}&includeGuids={include\_guids}
```
### Parameters
|Name|Description|
|ip\_address|The IP address of the Plex Media server.|
|plex\_token|The [Plex token](https://www.plexopedia.com/plex-media-server/general/plex-token/).|
|id|The ID associated with a movie library. This key can be found by calling the [Get All Movies API command](/plex-media-server/api/library/movies/) and using the value from the `ratingKey` attribute for the movie.|
|include\_guids|(Optional) Returns the GUID values of the online metadata services associated to the media item.|
## Return Status
|HTTP Code|Description|
|200|Success - The request was successful.|
|401|Unauthorized - The Plex token provided was not valid.|
|404|Not Found - The movie associated with the ID does not exist.|
## Response
XML string value that all the metadata for a movie. An example of the XML returned from the request is shown below:
```
\<?xml version="1.0" encoding="UTF-8"?\>
\<MediaContainer size="1" allowSync="1" identifier="com.plexapp.plugins.library" librarySectionID="2" librarySectionTitle="Movies" librarySectionUUID="493a64e7-b541-4667-b050-d702beebf2f6" mediaTagPrefix="/system/bundle/media/flags/" mediaTagVersion="1710434120"\>
\<Video ratingKey="65547" key="/library/metadata/65547" guid="plex://movie/5d776827eb5d26001f1ddab7" slug="aladdin" studio="Walt Disney Pictures" type="movie" title="Aladdin" librarySectionTitle="Movies" librarySectionID="2" librarySectionKey="/library/sections/2" contentRating="G" summary="Princess Jasmine grows tired of being forced to remain in the palace, so she sneaks out into the marketplace, in disguise, where she meets street urchin Aladdin. The couple falls in love, although Jasmine may only marry a prince. After being thrown in jail, Aladdin becomes embroiled in a plot to find a mysterious lamp, with which the evil Jafar hopes to rule the land." rating="9.5" audienceRating="9.2" skipCount="1" year="1992" tagline="Imagine if you had three wishes, three hopes, three dreams and they all could come true." thumb="/library/metadata/65547/thumb/1709463296" art="/library/metadata/65547/art/1709463296" duration="5423794" originallyAvailableAt="1992-11-25" addedAt="1450147195" updatedAt="1709463296" audienceRatingImage="rottentomatoes://image.rating.upright" chapterSource="mixed" primaryExtraKey="/library/metadata/282446" ratingImage="rottentomatoes://image.rating.ripe"\>
\<Media id="73681" duration="5423794" bitrate="2418" width="684" height="478" aspectRatio="1.66" audioChannels="6" audioCodec="ac3" videoCodec="h264" videoResolution="480" container="mkv" videoFrameRate="24p" videoProfile="high"\>
\<Part id="73812" key="/library/parts/73812/1450141780/file.mkv" duration="5423794" file="M:\\Media\\Movies\\Aladin (1992)\\Aladin (1992) [480p h.264][AAC AC3].mkv" size="1639520577" container="mkv" videoProfile="high"\>
\<Stream id="40197" streamType="1" default="1" codec="h264" index="0" bitrate="1970" anamorphic="1" bitDepth="8" chromaLocation="left" chromaSubsampling="4:2:0" codedHeight="480" codedWidth="688" colorPrimaries="smpte170m" colorRange="tv" colorSpace="smpte170m" colorTrc="bt709" frameRate="23.976" hasScalingMatrix="0" height="478" level="31" pixelAspectRatio="45:38" profile="high" refFrames="2" scanType="progressive" width="684" displayTitle="480p (H.264)" extendedDisplayTitle="480p (H.264)"\>\</Stream\>
\<Stream id="40198" streamType="2" selected="1" default="1" codec="aac" index="1" channels="2" language="English" languageTag="en" languageCode="eng" audioChannelLayout="stereo" profile="lc" samplingRate="48000" title="Stereo" displayTitle="English (AAC Stereo)" extendedDisplayTitle="Stereo (English AAC)"\>\</Stream\>
\<Stream id="40199" streamType="2" codec="ac3" index="2" channels="6" bitrate="448" language="English" languageTag="en" languageCode="eng" audioChannelLayout="5.1(side)" samplingRate="48000" title="Surround" displayTitle="English (AC3 5.1)" extendedDisplayTitle="Surround (English AC3 5.1)"\>\</Stream\>
\</Part\>
\</Media\>
\<Genre id="54" filter="genre=54" tag="Animation" /\>
\<Genre id="56" filter="genre=56" tag="Family" /\>
\<Genre id="55" filter="genre=55" tag="Comedy" /\>
\<Genre id="27" filter="genre=27" tag="Adventure" /\>
\<Genre id="228" filter="genre=228" tag="Fantasy" /\>
\<Genre id="229" filter="genre=229" tag="Romance" /\>
\<Genre id="11508" filter="genre=11508" tag="Musical" /\>
\<Country id="33499" filter="country=33499" tag="United States of America" /\>
\<Guid id="imdb://tt0103639" /\>
\<Guid id="tmdb://812" /\>
\<Guid id="tvdb://285" /\>
\<Rating image="imdb://image.rating" value="8.0" type="audience" /\>
\<Rating image="rottentomatoes://image.rating.ripe" value="9.5" type="critic" /\>
\<Rating image="rottentomatoes://image.rating.upright" value="9.2" type="audience" /\>
\<Rating image="themoviedb://image.rating" value="7.7" type="audience" /\>
\<Collection id="36907" filter="collection=36907" tag="Disney" /\>
\<Director id="63813" filter="director=63813" tag="Ron Clements" tagKey="5d776828eb5d26001f1ddbad" thumb="https://metadata-static.plex.tv/d/people/d74742d97f0defa7b2b2449cd05b42c1.jpg" /\>
\<Director id="63814" filter="director=63814" tag="John Musker" tagKey="5d776828eb5d26001f1ddbae" thumb="https://metadata-static.plex.tv/c/people/c655800f8a64d154e8b97a418c83ca2d.jpg" /\>
\<Writer id="63815" filter="writer=63815" tag="Ted Elliott" tagKey="5d776825999c64001ec2c031" thumb="https://metadata-static.plex.tv/9/people/99d15b121fcdd7ffb755c52729bac220.jpg" /\>
\<Writer id="63816" filter="writer=63816" tag="Terry Rossio" tagKey="5d776825999c64001ec2c032" thumb="https://metadata-static.plex.tv/d/people/d8b158f80da18d290f9b62f6f9d41543.jpg" /\>
\<Writer id="63817" filter="writer=63817" tag="Ron Clements" tagKey="5d776828eb5d26001f1ddbad" thumb="https://metadata-static.plex.tv/d/people/d74742d97f0defa7b2b2449cd05b42c1.jpg" /\>
\<Writer id="63818" filter="writer=63818" tag="John Musker" tagKey="5d776828eb5d26001f1ddbae" thumb="https://metadata-static.plex.tv/c/people/c655800f8a64d154e8b97a418c83ca2d.jpg" /\>
\<Writer id="63819" filter="writer=63819" tag="Roger Allers" tagKey="5d7768315af944001f1f90c3" thumb="https://metadata-static.plex.tv/people/5d7768315af944001f1f90c3.jpg" /\>
\<Role id="63820" filter="actor=63820" tag="Scott Weinger" tagKey="5d776828eb5d26001f1ddbaf" role="Aladdin (voice)" thumb="https://metadata-static.plex.tv/1/people/12cdb3918d07413713267ac9293a57cb.jpg" /\>
\<Role id="63821" filter="actor=63821" tag="Robin Williams" tagKey="5d7768253c3c2a001fbcad1e" role="Genie / Peddler (voice)" thumb="https://metadata-static.plex.tv/9/people/95500ffd58ef1bcef51dfafdb5523509.jpg" /\>
\<Role id="63822" filter="actor=63822" tag="Linda Larkin" tagKey="5d776828eb5d26001f1ddbb0" role="Jasmine (voice)" thumb="https://metadata-static.plex.tv/1/people/195d1ddcb495e419772a659f5b4edfa1.jpg" /\>
\<Role id="63823" filter="actor=63823" tag="Jonathan Freeman" tagKey="5d776828eb5d26001f1ddbb1" role="Jafar (voice)" thumb="https://metadata-static.plex.tv/4/people/415a1b293f03f8ce3ff5e4f09762d950.jpg" /\>
\<Role id="63824" filter="actor=63824" tag="Gilbert Gottfried" tagKey="5d776825eb5d26001f1dd1c1" role="Iago (voice)" thumb="https://metadata-static.plex.tv/0/people/0c10dd999315740f2317b714e199d276.jpg" /\>
\<Role id="63826" filter="actor=63826" tag="Douglas Seale" tagKey="5d776825151a60001f24a6cf" role="Sultan (voice)" thumb="https://metadata-static.plex.tv/people/5d776825151a60001f24a6cf.jpg" /\>
\<Role id="63825" filter="actor=63825" tag="Frank Welker" tagKey="5d7768255af944001f1f63df" role="Abu / Cave of Wonders / Rajah (voice)" thumb="https://metadata-static.plex.tv/7/people/741f85d6b299e3ef760bc38229479523.jpg" /\>
\<Role id="63827" filter="actor=63827" tag="Brad Kane" tagKey="5d776827151a60001f24ac2a" role="Aladdin (singing voice)" thumb="https://metadata-static.plex.tv/8/people/8fc731e75e25339843de238fc3958f94.jpg" /\>
\<Role id="63828" filter="actor=63828" tag="Lea Salonga" tagKey="5d776836a091de001f2e8209" role="Jasmine (singing voice)" thumb="https://metadata-static.plex.tv/5/people/54ac68fc7e8fbe3bec1131b3678dd631.jpg" /\>
\<Role id="63829" filter="actor=63829" tag="Bruce Adler" tagKey="5d776b23f617c90020172853" role="Peddler (singing voice)" thumb="https://metadata-static.plex.tv/2/people/28d04527e1bc20e677f59c769d4a4980.jpg" /\>
\<Role id="63830" filter="actor=63830" tag="Charlie Adler" tagKey="5d776828eb5d26001f1ddbb5" role="Additional Voices (voice)" thumb="https://metadata-static.plex.tv/people/5d776828eb5d26001f1ddbb5.jpg" /\>
\<Role id="63831" filter="actor=63831" tag="Jack Angel" tagKey="5d776824961905001eb90980" role="Additional Voices (voice)" thumb="https://metadata-static.plex.tv/c/people/c481265627779680d9af4b8e618ab636.jpg" /\>
\<Role id="63832" filter="actor=63832" tag="Corey Burton" tagKey="5d7768256f4521001ea98a04" role="Additional Voices (voice)" thumb="https://metadata-static.plex.tv/3/people/329782adaa4867c4a78adceffc942b2e.jpg" /\>
\<Role id="63833" filter="actor=63833" tag="Philip L. Clarke" tagKey="5d776828eb5d26001f1ddbb6" role="Additional Voices (voice)" thumb="https://metadata-static.plex.tv/people/5d776828eb5d26001f1ddbb6.jpg" /\>
\<Role id="63834" filter="actor=63834" tag="Jim Cummings" tagKey="5d776828eb5d26001f1ddbb7" role="Additional Voices (voice)" thumb="https://metadata-static.plex.tv/people/5d776828eb5d26001f1ddbb7.jpg" /\>
\<Role id="63835" filter="actor=63835" tag="Jennifer Darling" tagKey="5d776827151a60001f24aafd" role="Additional Voices (voice)" thumb="https://metadata-static.plex.tv/people/5d776827151a60001f24aafd.jpg" /\>
\<Role id="89537" filter="actor=89537" tag="Dee Dee Greene" tagKey="5d7768256f4521001ea98a07" role="Additional Voices (voice)" thumb="https://metadata-static.plex.tv/5/people/502aa88e9f5f606cfdf8998264a7ef49.jpg" /\>
\<Role id="63837" filter="actor=63837" tag="Bruce Gooch" tagKey="5d776828eb5d26001f1ddbb9" role="Additional Voices (voice)" /\>
\<Role id="63838" filter="actor=63838" tag="Jerry Houser" tagKey="5d7768313c3c2a001fbcd4bd" role="Additional Voices (voice)" thumb="https://metadata-static.plex.tv/people/5d7768313c3c2a001fbcd4bd.jpg" /\>
\<Role id="63839" filter="actor=63839" tag="Vera Lockwood" tagKey="5d7768572e80df001ebe1e13" role="Additional Voices (voice)" /\>
\<Role id="63840" filter="actor=63840" tag="Sherry Lynn" tagKey="5d776826eb5d26001f1dd581" role="Additional Voices (voice)" thumb="https://metadata-static.plex.tv/people/5d776826eb5d26001f1dd581.jpg" /\>
\<Role id="63841" filter="actor=63841" tag="Mickie McGowan" tagKey="5d776824961905001eb9097f" role="Additional Voices (voice)" thumb="https://metadata-static.plex.tv/1/people/1072b53cc1b77c89da25f5b1cb7dbd58.jpg" /\>
\<Role id="63842" filter="actor=63842" tag="Patrick Pinney" tagKey="5d776825151a60001f24a3d9" role="Additional Voices (voice)" thumb="https://metadata-static.plex.tv/1/people/1f085f6fa79999d23882f1cbf3855ae3.jpg" /\>
\<Role id="63843" filter="actor=63843" tag="Phil Proctor" tagKey="5d776827151a60001f24aaf9" role="Additional Voices (voice)" thumb="https://metadata-static.plex.tv/1/people/1d34bf9a2fbb44b836769d5efd7610a8.jpg" /\>
\<Role id="63844" filter="actor=63844" tag="Hal Smith" tagKey="5d77682e961905001eb92c92" role="Jafar's Horse (voice) (uncredited)" thumb="https://metadata-static.plex.tv/people/5d77682e961905001eb92c92.jpg" /\>
\<Role id="63845" filter="actor=63845" tag="Teddy Newton" tagKey="5d77682b8718ba001e312767" role="Agrabah Villagers (voice) (uncredited)" thumb="https://metadata-static.plex.tv/a/people/ab037947777c4531d2baa011466cb4e7.jpg" /\>
\<Producer id="63846" filter="producer=63846" tag="Ron Clements" tagKey="5d776828eb5d26001f1ddbad" thumb="https://metadata-static.plex.tv/d/people/d74742d97f0defa7b2b2449cd05b42c1.jpg" /\>
\<Producer id="63847" filter="producer=63847" tag="John Musker" tagKey="5d776828eb5d26001f1ddbae" thumb="https://metadata-static.plex.tv/c/people/c655800f8a64d154e8b97a418c83ca2d.jpg" /\>
\<Similar id="33688" filter="similar=33688" tag="Beauty and the Beast" /\>
\<Similar id="33689" filter="similar=33689" tag="The Little Mermaid" /\>
\<Similar id="21936" filter="similar=21936" tag="Snow White and the Seven Dwarfs" /\>
\<Similar id="33690" filter="similar=33690" tag="Cinderella" /\>
\<Similar id="21937" filter="similar=21937" tag="The Jungle Book" /\>
\<Similar id="33691" filter="similar=33691" tag="One Hundred and One Dalmatians" /\>
\<Similar id="33692" filter="similar=33692" tag="Tarzan" /\>
\<Similar id="33693" filter="similar=33693" tag="Peter Pan" /\>
\<Similar id="33694" filter="similar=33694" tag="Alice in Wonderland" /\>
\<Similar id="21943" filter="similar=21943" tag="Bambi" /\>
\<Similar id="33695" filter="similar=33695" tag="Pocahontas" /\>
\<Similar id="27288" filter="similar=27288" tag="Hercules" /\>
\<Similar id="33696" filter="similar=33696" tag="Sleeping Beauty" /\>
\<Similar id="33697" filter="similar=33697" tag="The Hunchback of Notre Dame" /\>
\<Similar id="33698" filter="similar=33698" tag="Lady and the Tramp" /\>
\<Similar id="33699" filter="similar=33699" tag="Pinocchio" /\>
\<Similar id="33700" filter="similar=33700" tag="Mulan" /\>
\<Similar id="33701" filter="similar=33701" tag="Dumbo" /\>
\<Similar id="33702" filter="similar=33702" tag="The Aristocats" /\>
\<Similar id="33703" filter="similar=33703" tag="Robin Hood" /\>
\<Field locked="1" name="thumb" /\>
\<Field locked="1" name="collection" /\>
\</Video\>
\</MediaContainer\>
```
The response contains all the metadata for the movie. The root is the `MediaContainer` element. This element contains a few attributes that provide overall information about the movie from the server.
MediaContainer Attributes|Attribute|Description|
|size|The number of movies.|
|allowSync|1 - allow syncing content.
0 - don't allow syncing content.|
|identifier|The type of item.|
|librarySectionID|The unique key associated with the library.|
|librarySectionTitle|The title of the library.|
|librarySectionUUID|Unique GUID identifier for the library.|
|mediaTagPrefix|Prefix for the media tag.|
|mediaTagVersion|Media tag version.
**Note:** This could be a date and time value.|
Within the `MediaContainer` there is one `Video` child element that represents the movie.
Video Attributes|Attribute|Description|
|ratingKey|A key associated with the movie.|
|key|The relative URL of the movie information.|
|guid|The unique identifier comprised of the Plex agent and movie identifier for the agent.|
|slug|The short path name for the movie.|
|studio|The name of the movie studio.|
|type|The type of media.|
|title|The title of the movie.|
|librarySectionTitle|The name of the library section where the movie is located.|
|librarySectionID|The ID of the library section.|
|librarySectionKey|The relative URL of the library section.|
|contentRating|The content rating associated with the movie.|
|summary|A summary of the movie.|
|rating|The rating for the movie.|
|audienceRating|The audience rating for the movie.|
|viewCount|The number of times the movie has been viewed.|
|skipCount|The skip count.|
|year|The year the movie was released.|
|tagline|The tagline associated with the movie.|
|thumb|The thumbnail for the movie.|
|art|The background artwork used to represent the movie.|
|duration|The length of the movie in milliseconds.|
|originallyAvailableAt|The original release date of the movie.|
|addedAt|The date and time, in [Unix time](https://en.wikipedia.org/wiki/Unix_time), the movie was added to the library.|
|updatedAt|The date and time in [epoch time](https://en.wikipedia.org/wiki/Unix_time), the movie was updated in the library.|
|audienceRatingImage|The image associated with the audience rating.|
|chapterSource|The chapter source type.|
|primaryExtraKey|The extra key value.|
|ratingImage|The image associated with the rating.|
Within the `Video` there are one or more `Media` child elements. Each `Media` element represents one media file of the movie available on the Plex server.
If there are two media files associated with the movie, such as a 1080p and 480p version, then there would be two `Media` child elements in the `Video` element.
Media Attributes|Attribute|Description|
|id|Unique ID associated with the item.|
|duration|The length of the item in milliseconds.|
|bitrate|The bitrate of the item.|
|width|The width of the item.|
|height|The height of the item.|
|aspectRatio|The aspect ratio of the item.|
|audioChannels|The number of audio channels.|
|audioCodec|The audio codec used to encode the audio.|
|videoCodec|The video codec used to encode the video.|
|videoResolution|The video resolution.|
|container|The item container.|
|videoFrameRate|The framerate standard used for the video.|
|videoProfile|The video profile of the media.|
Within the `Media` there are one or more `Part` child elements. Each `Part` element represents one part of the movie. If the movie has been added to the Plex server as a multi-part movie, then each of those parts will be represented by one `Part` child element.
Part Attributes|Attribute|Description|
|id|Unique ID associated with the part.|
|key|The unique relative path for the part that is used at its key.|
|duration|The length of the part in milliseconds.|
|file|The file associated with the part.|
|size|The file size of the part.|
|container|The type of media container.|
|videoProfile|The video profile associated with the video part.|
Also within the `Video` element there are multiple additional child elements that provide more details about the movie. These child elements include `Genre`, `Director`, `Writer`, `Country`, `Collection`, and `Role`.
Within each of these child elements is a single `tag` attribute that provides the information for the element. There could be multiple of the same child element within the `Video`, such as multiple directors or writers.
Genre Attributes|Attribute|Description|
|tag|A genre of the movie.|
Director Attributes|Attribute|Description|
|tag|A director of the movie.|
Writer Attributes|Attribute|Description|
|tag|A writer for the movie|
Country Attributes|Attribute|Description|
|tag|A country of origin for the movie.|
Collection Attributes|Attribute|Description|
|tag|The name of a collection containing the movie.|
Role Attributes|Attribute|Description|
|tag|The name of a person with a role in the movie.|
If the `include\_guids` parameter was specified with the value of 1, then there would be a `Guid` element for each online metadata service associated with the item.
## Examples
curl Python Powershell
```
curl -X GET http://{ip\_address}:32400/library/metadata/{id}?X-Plex-Token={plex\_token}
```
```
import requests
plex\_url = http://{ip\_address}:32400/library/metadata/{id}?X-Plex-Token={plex\_token}
response = requests.get(plex\_url)
print(response.text)
```
```
$response = Invoke-RestMethod 'http://{ip\_address}:32400/library/metadata/{id}?X-Plex-Token={plex\_token}' -Method GET
Write-Output $response
```
[ Buy me a coffee](https://buymeacoffee.com/plexopedia)
Subscribe
Name:
Email:
Articles
API
Blog Posts
[API Home](https://www.plexopedia.com/plex-media-server/api/) [Plex.tv API Home](https://www.plexopedia.com/plex-media-server/api-plextv/)### Server
[Server Capabilities](https://www.plexopedia.com/plex-media-server/api/server/capabilities/) [Server Identity](https://www.plexopedia.com/plex-media-server/api/server/identity/) [Get Server Preferences](https://www.plexopedia.com/plex-media-server/api/server/preferences/) [Set a Server Preference](https://www.plexopedia.com/plex-media-server/api/server/preference-set/) [Get Server List](https://www.plexopedia.com/plex-media-server/api/server/list/) [Get Accounts](https://www.plexopedia.com/plex-media-server/api/server/accounts/) [Get a Single Account](https://www.plexopedia.com/plex-media-server/api/server/account/) [Get Devices](https://www.plexopedia.com/plex-media-server/api/server/devices/) [Get a Single Device](https://www.plexopedia.com/plex-media-server/api/server/device/) [Get All Activities](https://www.plexopedia.com/plex-media-server/api/server/activities/) [Stop an Activity](https://www.plexopedia.com/plex-media-server/api/server/stop-activity/) [Get Transient Token](https://www.plexopedia.com/plex-media-server/api/server/transient-token/) [Perform Search](https://www.plexopedia.com/plex-media-server/api/server/search/) [Listen for Notifications](https://www.plexopedia.com/plex-media-server/api/server/listen-notifications/) [Listen for Events](https://www.plexopedia.com/plex-media-server/api/server/listen-events/) [Check for Updates](https://www.plexopedia.com/plex-media-server/api/server/update-check/) [Get Update Status](https://www.plexopedia.com/plex-media-server/api/server/update-status/)
### Sessions
[Get Active Sessions](https://www.plexopedia.com/plex-media-server/api/server/sessions/) [Get Transcode Sessions](https://www.plexopedia.com/plex-media-server/api/server/transcode-sessions/) [Terminate a Session](https://www.plexopedia.com/plex-media-server/api/server/session-terminate/) [Terminate a Transcode Session](https://www.plexopedia.com/plex-media-server/api/server/session-transcode-terminate/) [Get Session History](https://www.plexopedia.com/plex-media-server/api/server/session-history/)
### Library
[Get Libraries](https://www.plexopedia.com/plex-media-server/api/server/libraries/) [Get Library Details](https://www.plexopedia.com/plex-media-server/api/library/details/) [Add a Library](https://www.plexopedia.com/plex-media-server/api/library/add/) [Delete a Library](https://www.plexopedia.com/plex-media-server/api/server/library-delete/) [Scan All Libraries](https://www.plexopedia.com/plex-media-server/api/library/scan/) [Scan a Single Library](https://www.plexopedia.com/plex-media-server/api/library/scan-single/) [Scan a Partial Library](https://www.plexopedia.com/plex-media-server/api/library/scan-partial/) [Refresh Metadata for a Library](https://www.plexopedia.com/plex-media-server/api/library/refresh-metadata/)
### Media
[Get Recently Added Media](https://www.plexopedia.com/plex-media-server/api/library/recently-added/) [Mark Item as Watched](https://www.plexopedia.com/plex-media-server/api/library/media-mark-watched/) [Mark Item as Unwatched](https://www.plexopedia.com/plex-media-server/api/library/media-mark-unwatched/) [Search for Match](https://www.plexopedia.com/plex-media-server/api/library/search-match/) [Download Media File](https://www.plexopedia.com/plex-media-server/api/library/download-media-file/) [Update Play Progress](https://www.plexopedia.com/plex-media-server/api/server/update-media-progress/)
### Movies
[Get All Movies](https://www.plexopedia.com/plex-media-server/api/library/movies/) Get a Movie [Update a Movie](https://www.plexopedia.com/plex-media-server/api/library/movie-update/) [Update a Movie Using Match](https://www.plexopedia.com/plex-media-server/api/library/movie-update-match/) [Delete a Movie](https://www.plexopedia.com/plex-media-server/api/library/movie-delete/) [Get Newest Movies](https://www.plexopedia.com/plex-media-server/api/library/movies-newest/) [Get Recently Added Movies](https://www.plexopedia.com/plex-media-server/api/library/movies-recently-added/) [Get Recently Viewed Movies](https://www.plexopedia.com/plex-media-server/api/library/movies-recently-viewed/) [Get On Deck Movies](https://www.plexopedia.com/plex-media-server/api/library/movies-on-deck/) [Get All Movies for a Resolution](https://www.plexopedia.com/plex-media-server/api/library/movies-resolution/) [Get All Movies for a Decade](https://www.plexopedia.com/plex-media-server/api/library/movies-decade/) [Get All Unwatched Movies for a User](https://www.plexopedia.com/plex-media-server/api/library/movies-unwatched/) [Get a Movie's Poster](https://www.plexopedia.com/plex-media-server/api/library/movie-poster/) [Get a Movie's Background](https://www.plexopedia.com/plex-media-server/api/library/movie-background/)
### TV Shows
[Get All TV Shows](https://www.plexopedia.com/plex-media-server/api/library/tvshows/) [Get All TV Show Seasons](https://www.plexopedia.com/plex-media-server/api/library/tvshows-seasons/) [Update a TV Show Series Using Match](https://www.plexopedia.com/plex-media-server/api/library/tvshow-update-match/) [Get All TV Show Episodes](https://www.plexopedia.com/plex-media-server/api/library/tvshows-episodes/) [Get Recently Added TV Shows](https://www.plexopedia.com/plex-media-server/api/library/tvshows-recently-added/)
### Music
[Get All Music Artists](https://www.plexopedia.com/plex-media-server/api/library/music/) [Get All Music Albums for an Artist](https://www.plexopedia.com/plex-media-server/api/library/music-albums-artist/) [Get All Tracks for a Music Album](https://www.plexopedia.com/plex-media-server/api/library/music-albums-tracks/) [Update Music Artist Details Using Match](https://www.plexopedia.com/plex-media-server/api/library/music-artist-update-match/) [Update Music Album Details Using Match](https://www.plexopedia.com/plex-media-server/api/library/music-album-update-match/)
### Photos
[Get All Photos](https://www.plexopedia.com/plex-media-server/api/library/photos/) [Add a Photo to Favorites](https://www.plexopedia.com/plex-media-server/api/library/photo-favorites-add/)
### Other Videos
[Get All Videos](https://www.plexopedia.com/plex-media-server/api/library/videos/)
### Playlists
[Get All Playlists](https://www.plexopedia.com/plex-media-server/api/playlists/view/) [Get a Playlist](https://www.plexopedia.com/plex-media-server/api/playlists/view-single/) [Create a Playlist](https://www.plexopedia.com/plex-media-server/api/playlists/create/) [Update a Playlist](https://www.plexopedia.com/plex-media-server/api/playlists/update/) [Delete a Playlist](https://www.plexopedia.com/plex-media-server/api/playlists/delete/) [Get Items in a Playlist](https://www.plexopedia.com/plex-media-server/api/playlists/view-items/) [Add an Item to a Playlist](https://www.plexopedia.com/plex-media-server/api/playlists/add-item/) [Delete an Item from a Playlist](https://www.plexopedia.com/plex-media-server/api/playlists/delete-item/) [Delete All Items from a Playlist](https://www.plexopedia.com/plex-media-server/api/playlists/delete-items/)
### Maintenance
[Empty Trash](https://www.plexopedia.com/plex-media-server/api/library/empty-trash/) [Clean Bundles](https://www.plexopedia.com/plex-media-server/api/library/clean-bundles/) [Optimize Database](https://www.plexopedia.com/plex-media-server/api/library/optimize-database/)
### Scheduled Tasks
[Get All Scheduled Tasks](https://www.plexopedia.com/plex-media-server/api/server/scheduled-tasks/) [Run All Scheduled Tasks](https://www.plexopedia.com/plex-media-server/api/server/task-run-all/) [Stop All Scheduled Tasks](https://www.plexopedia.com/plex-media-server/api/server/task-stop-all/) [Run Backup Database Task](https://www.plexopedia.com/plex-media-server/api/server/task-backup-database/) [Stop Backup Database Task](https://www.plexopedia.com/plex-media-server/api/server/task-backup-database-stop/) [Run Optimize Database Task](https://www.plexopedia.com/plex-media-server/api/server/task-optimize-database/) [Stop Optimize Database Task](https://www.plexopedia.com/plex-media-server/api/server/task-optimize-database-stop/) [Run Clean Old Bundles Task](https://www.plexopedia.com/plex-media-server/api/server/task-clean-old-bundles/) [Stop Clean Old Bundles Task](https://www.plexopedia.com/plex-media-server/api/server/task-clean-old-bundles-stop/) [Run Clean Old Cache Files Task](https://www.plexopedia.com/plex-media-server/api/server/task-clean-old-cache-files/) [Stop Clean Old Cache Files Task](https://www.plexopedia.com/plex-media-server/api/server/task-clean-old-cache-files-stop/) [Run Refresh Local Metadata Task](https://www.plexopedia.com/plex-media-server/api/server/task-refresh-local-metadata/) [Stop Refresh Local Metadata Task](https://www.plexopedia.com/plex-media-server/api/server/task-refresh-local-metadata-stop/) [Run Refresh Libraries Task](https://www.plexopedia.com/plex-media-server/api/server/task-refresh-libraries/) [Stop Refresh Libraries Task](https://www.plexopedia.com/plex-media-server/api/server/task-refresh-libraries-stop/) [Run Extensive Media Analysis Task](https://www.plexopedia.com/plex-media-server/api/server/task-extensive-media-analysis/) [Stop Extensive Media Analysis Task](https://www.plexopedia.com/plex-media-server/api/server/task-extensive-media-analysis-stop/) [Run Refresh Metadata Periodically Task](https://www.plexopedia.com/plex-media-server/api/server/task-refresh-metadata-periodically/) [Stop Refresh Metadata Periodically Task](https://www.plexopedia.com/plex-media-server/api/server/task-refresh-metadata-periodically-stop/) [Run Upgrade Media Analysis Task](https://www.plexopedia.com/plex-media-server/api/server/task-upgrade-media-analysis/) [Stop Upgrade Media Analysis Task](https://www.plexopedia.com/plex-media-server/api/server/task-upgrade-media-analysis-stop/)
### Troubleshooting
[Log a Single Message](https://www.plexopedia.com/plex-media-server/api/server/log-single/) [Log Multiple Messages](https://www.plexopedia.com/plex-media-server/api/server/log-multiple/) [Download Databases](https://www.plexopedia.com/plex-media-server/api/server/download-databases/) [Download Logs](https://www.plexopedia.com/plex-media-server/api/server/download-logs/)
### Reference
[Arrays](https://www.plexopedia.com/plex-media-server/api/arrays/) [Filtering](https://www.plexopedia.com/plex-media-server/api/filter/)
[&uarr;](#top-of-page)