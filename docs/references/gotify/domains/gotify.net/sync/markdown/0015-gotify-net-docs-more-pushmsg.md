(more) Push message examples | Gotify
[Skip to content](#VPContent)
Menu
Return to top
# (more) Push message examples [​](#more-push-message-examples)
Have a look [here](./pushmsg) for "How to obtain an application token".
NOTE: Assuming Gotify is running on `http://localhost:8008`.
### Bash (using cURL and markdown) [​](#bash-using-curl-and-markdown)
bash
```
`#!/bin/bash
TITLE="My Title"
MESSAGE="Hello: ![](https://gotify.net/img/logo.png)"
PRIORITY=5
URL="http://localhost:8008/message?token=\<apptoken\>"
curl -s -S --data '{"message": "'"${MESSAGE}"'", "title": "'"${TITLE}"'", "priority":'"${PRIORITY}"', "extras": {"client::display": {"contentType": "text/markdown"}}}' -H 'Content-Type: application/json' "$URL"`
```
### Python [​](#python)
python
```
`import requests #pip install requests
resp = requests.post('http://localhost:8008/message?token=\<apptoken\>', json={
"message": "Well hello there.",
"priority": 2,
"title": "This is my title"
})`
```
### Golang [​](#golang)
go
```
`package main
import (
"net/http"
"net/url"
)
func main() {
http.PostForm("http://localhost:8008/message?token=\<apptoken\>",
url.Values{"message": {"My Message"}, "title": {"My Title"}})
}`
```
### PHP (using cURL) [​](#php-using-curl)
php
```
`$data = [
"title"=\> "Hello World",
"message"=\> "Test push From PHP cURL.",
"priority"=\> 5,
];
$data\_string = json\_encode($data);
$url = "http://localhost:8008/message?token=\<apptoken\>";
$headers = [
"Content-Type: application/json; charset=utf-8"
];
$ch = curl\_init();
curl\_setopt($ch, CURLOPT\_URL, $url);
curl\_setopt($ch, CURLOPT\_POST, 1);
curl\_setopt($ch, CURLOPT\_HTTPHEADER, $headers );
curl\_setopt($ch, CURLOPT\_RETURNTRANSFER, true );
curl\_setopt($ch, CURLOPT\_POSTFIELDS, $data\_string);
$result = curl\_exec($ch);
$code = curl\_getinfo($ch, CURLINFO\_HTTP\_CODE);
curl\_close ($ch);
switch ($code) {
case "200":
echo "\<strong\>Your Message was Submitted\</strong\>";
break;
case "400":
echo "\<strong\>Bad Request\</strong\>";
break;
case "401":
echo "\<strong\>Unauthorized Error - Invalid Token\</strong\>";
break;
case "403":
echo "\<strong\>Forbidden\</strong\>";
break;
case "404":
echo "\<strong\>API URL Not Found\</strong\>";
break;
default:
echo "\<strong\>Hmm Something Went Wrong or HTTP Status Code is Missing\</strong\>";
}`
```
### JavaScript [​](#javascript)
javascript
```
`const axios = require('axios');
const url = 'http://localhost:8008/message?token=\<apptoken\>';
const bodyFormData = {
title: 'Hello from Javascript',
message: 'Test Push Service from Node.js',
priority: 5,
};
axios({
method: 'post',
headers: {
'Content-Type': 'application/json',
},
url: url,
data: bodyFormData,
})
.then((response) =\> console.log(response.data))
.catch((err) =\> console.log(err.response ? error.response.data : err));`
```
### Java 11 [​](#java-11)
With Maven dependency:
xml
```
`\<dependency\>
\<groupId\>com.fasterxml.jackson.core\</groupId\>
\<artifactId\>jackson-databind\</artifactId\>
\<version\>2.12.1\</version\>
\</dependency\>`
```
And code:
java
```
`package com.gotify.client;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
public class GotifyClient {
private static final String BASE\_URL = "http://localhost:8080";
private static final String TOKEN = "\<YOUR\_TOKEN\>";
public static void main(String[] args) throws IOException, InterruptedException {
final var client = new GotifyClient(BASE\_URL, TOKEN);
final var message = new Message("My Title", "Hello from Java!", 10);
if (client.sendMessage(message)) {
System.out.println("Message sent!");
} else {
System.out.println("Something went wrong :(.");
}
}
private final String gotifyUrl;
private final HttpClient httpClient;
private final ObjectMapper objectMapper;
public GotifyClient(String baseUrl, String token) {
this.gotifyUrl = String.format("%s/message?token=%s", baseUrl, token);
this.httpClient = HttpClient.newHttpClient();
this.objectMapper = new ObjectMapper();
}
private boolean sendMessage(Message message) throws IOException, InterruptedException {
final var bodyData = objectMapper.writeValueAsString(message);
final var request = HttpRequest.newBuilder()
.uri(URI.create(gotifyUrl))
.header("Content-Type", "application/json")
.POST(HttpRequest.BodyPublishers.ofString(bodyData))
.build();
final var response = httpClient.send(request, HttpResponse.BodyHandlers.ofString());
System.out.println(response.body());
return response.statusCode() \>= 200 && response.statusCode() \< 400;
}
public static class Message {
private String message;
private String title;
private int priority;
public Message(String title, String message, int priority) {
this.message = message;
this.priority = priority;
this.title = title;
}
public String getMessage() { return message; }
public void setMessage(String message) { this.message = message; }
public int getPriority() { return priority; }
public void setPriority(int priority) { this.priority = priority; }
public String getTitle() { return title; }
public void setTitle(String title) { this.title = title; }
}
}`
```
### VB/VBA [​](#vb-vba)
vb
```
`Const GOTIFY\_URL As String = "http://localhost:8008/message?token=\<apptoken\>"
'--- Based on pushover-vba by Mauricio Arieira (https://github.com/makah/pushover-vba)
Public Function PushToGotify(ByVal title As String, ByVal message As String, ByVal priority As Integer) As String
Dim xhttp As Object, params As String
params = "title=" & title & "&message=" & message & "&priority=" & priority
Set xhttp = CreateObject("MSXML2.ServerXMLHTTP")
With xhttp
.Open "POST", GOTIFY\_URL, False
.setRequestHeader "Content-type", "application/x-www-form-urlencoded"
.Send params
PushToGotify = .responseText
End With
End Function
' Test PushToGotify function
Public Sub Test\_PushToGotify()
Debug.Print PushToGotify(GOTIFY\_URL, "My Title", "Hello there!", 2)
End Sub`
```
### Wget [​](#wget)
sh
```
`token="\<apptoken\>"
subject="wget"
message="Test push from wget"
priority=5
wget "http://localhost:8008/message?token=$token" --post-data "title=$subject&message=$message&priority=$priority" -O /dev/null`
```