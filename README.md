# README

* Ruby version : 2.6.5
* Rails version: 6.0.0
* SqLite3 Version: 1.4
* Configuration
    * Install Packages
    `bundle`

    * Database creation: 
    `rake db:create`

    * Database initialization: 
    `rake db:migrate`

# API METHODS:

## Parse WebSite ##

### GET  http://localhost:3000/parse_website?weburl=<WEBURL>

#### Headers
`Accept: application/vnd.api+json`
#### Params

PARAMETER: weburl -> The website's url to parse

#### Examples:

* Curl
`curl --location --request GET "http://localhost:3000/parse_website?weburl=https://hugotunius.se/" --header "Accept: application/vnd.api+json"}`

* Ruby
```
require "uri"
require "net/http"

url = URI("http://localhost:3000/parse_website?weburl=https://hugotunius.se/")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Accept"] = "application/vnd.api+json"

response = http.request(request)
puts response.read_body

```

## Get the list of websites parsed ##

### GET http://localhost:3000/web-page 

#### HEADERS
* Accept: application/vnd.api+json
* Content-Type: application/vnd.api+json

#### Examples:

* Curl
```
curl --location --request GET "http://localhost:3000/web-page" \
  --header "Accept: application/vnd.api+json" \
  --header "Content-Type: application/vnd.api+json"

```
* Ruby
```
require "uri"
require "net/http"

url = URI("http://localhost:3000/web-page")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Accept"] = "application/vnd.api+json"
request["Content-Type"] = "application/vnd.api+json"

response = http.request(request)
puts response.read_body
```

## Get the websites content ##

### GET http://localhost:3000/web-page-detail 

#### HEADERS
* Accept: application/vnd.api+json
* Content-Type: application/vnd.api+json

#### Examples:
* Curl
```
curl --location --request GET "http://localhost:3000/web-page-detail" \
  --header "Accept: application/vnd.api+json" \
  --header "Content-Type: application/vnd.api+json"

```
* Ruby
```
require "uri"
require "net/http"

url = URI("http://localhost:3000/web-page-detail")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Accept"] = "application/vnd.api+json"
request["Content-Type"] = "application/vnd.api+json"

response = http.request(request)
puts response.read_body
```