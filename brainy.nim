# Brainyquote of the day

import httpClient
import htmlparser
import xmltree
import strtabs

var url = "https://www.brainyquote.com/quote_of_the_day"

var client = newHttpClient()
var content = client.getContent(url)

let xml = htmlparser.parseHtml(content)

var title = ""
var description = ""

for property in xml.findAll("meta"):
  case property.attr("name"):
    of "twitter:title":
      title = property.attr("content")
    of "twitter:description":
      description = property.attr("content")

echo title
echo description
