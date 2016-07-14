require 'net/http'
require 'json'
require 'rubygems'
require 'rexml/document'
require 'xmlsimple'


 # In our actual program, this hash below is a giant hash of some 40000 zip codes. We shortened it, showing only the first 13 lines here for context. See more at https://jeffreybreen.wordpress.com/2010/12/11/geocode-zip-codes/ or contact the developer for the complete hash.
@@zipshash = {
"00210"=>{:lat => '43.005895',:long => '-71.013202',:city => 'Portsmouth'},
"00211"=>{:lat => '43.005895',:long => '-71.013202',:city => 'Portsmouth'},
"00212"=>{:lat => '43.005895',:long => '-71.013202',:city => 'Portsmouth'},
"00213"=>{:lat => '43.005895',:long => '-71.013202',:city => 'Portsmouth'},
"00214"=>{:lat => '43.005895',:long => '-71.013202',:city => 'Portsmouth'},
"00215"=>{:lat => '43.005895',:long => '-71.013202',:city => 'Portsmouth'},
"00501"=>{:lat => '40.922326',:long => '-72.637078',:city => 'Holtsville'},
"00544"=>{:lat => '40.922326',:long => '-72.637078',:city => 'Holtsville'},
"00601"=>{:lat => '18.180103',:long => '-66.74947',:city => 'Adjuntas'},
"00602"=>{:lat => '18.363285',:long => '-67.18024',:city => 'Aguada'},
"00603"=>{:lat => '18.448619',:long => '-67.13422',:city => 'Aguadilla'},
"00604"=>{:lat => '18.498987',:long => '-67.13699',:city => 'Aguadilla'},
"00605"=>{:lat => '18.465162',:long => '-67.141486',:city => 'Aguadilla'},
"00606"=>{:lat => '18.182151',:long => '-66.9588',:city => 'Maricao'}
}




@engadgetfull = ""

def engadgetorig
  request5 = "https://www.engadget.com/rss.xml"
  uri5 = URI(request5)
  response5 = Net::HTTP.get(uri5)
  data = XmlSimple.xml_in(response5)
  @engadgetfull = data
end

def engadget(content)
  @engadgetresult = ""
if content == "name1"
  @engadgetresult = @engadgetfull["channel"][0]["item"][0]["title"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&agrave;", "á ").gsub("\n", " ")
elsif content == "description1"
  description1 = @engadgetfull["channel"][0]["item"][0]["description"].to_s
  @engadgetresult = description1.gsub("\n", "a").split(">")[1].split("..")[0].gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("\n", " ") + "..."
  @engadgetresult = @engadgetresult.gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "")
elsif content == "url1"
  @engadgetresult = @engadgetfull["channel"][0]["item"][0]["link"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&agrave;", "á ").gsub("\n", " ")
elsif content == "name2"
  @engadgetresult = @engadgetfull["channel"][0]["item"][1]["title"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&agrave;", "á ").gsub("\n", " ")
elsif content == "description2"
  description2 = @engadgetfull["channel"][0]["item"][1]["description"].to_s
  @engadgetresult = description2.split(">")[1].split("..")[0].gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("\n", " ") + "..."
  @engadgetresult = @engadgetresult.gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "")
elsif content == "url2"
  @engadgetresult = @engadgetfull["channel"][0]["item"][1]["link"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&agrave;", "á ").gsub("\n", " ")
elsif content == "name3"
  @engadgetresult = @engadgetfull["channel"][0]["item"][2]["title"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&agrave;", "á ").gsub("\n", " ")
elsif content == "description3"
  description3 = @engadgetfull["channel"][0]["item"][2]["description"].to_s
  @engadgetresult = description3.split(">")[1].split("..")[0].gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("\n", " ") + "..."
  @engadgetresult = @engadgetresult.gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "")
elsif content == "url3"
  @engadgetresult = @engadgetfull["channel"][0]["item"][2]["link"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&agrave;", "á ").gsub("\n", " ")
elsif content == "name4"
  @engadgetresult = @engadgetfull["channel"][0]["item"][3]["title"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&agrave;", "á ").gsub("\n", " ")
elsif content == "description4"
  description4 = @engadgetfull["channel"][0]["item"][3]["description"].to_s
  @engadgetresult = description4.split(">")[1].split("..")[0].gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("\n", " ") + "..."
  @engadgetresult = @engadgetresult.gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "")
elsif content == "url4"
  @engadgetresult = @engadgetfull["channel"][0]["item"][3]["link"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&agrave;", "á ").gsub("\n", " ")
elsif content == "name5"
  @engadgetresult = @engadgetfull["channel"][0]["item"][4]["title"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&agrave;", "á ").gsub("\n", " ")
elsif content == "description5"
  description5 = @engadgetfull["channel"][0]["item"][4]["description"].to_s
  @engadgetresult = description5.split(">")[1].split("..")[0].gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("\n", " ") + "..."
  @engadgetresult = @engadgetresult.gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "")
elsif content == "url5"
  @engadgetresult = @engadgetfull["channel"][0]["item"][4]["link"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&agrave;", "á ").gsub("\n", " ")
end
  puts "#{content} returned #{@engadgetresult}"
  return @engadgetresult
end


@abcfull = ""

def abcorig
  # this is the request that calls the Australian Broadcasting Company request4 = "http://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://www.abc.net.au/news/feed/51120/rss.json&num=10"
  request4 = "http://feeds.abcnews.com/abcnews/topstories"
  uri4 = URI(request4)
  response4 = Net::HTTP.get(uri4)
  data = XmlSimple.xml_in(response4)
  @abcfull = data
end

def abc(content)
  @abcresult = ""
if content == "name1"
  @abcresult = @abcfull["channel"][0]["item"][1]["title"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ")
elsif content == "description1"
  @abcresult = @abcfull["channel"][0]["item"][1]["description"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ")
  @abcresult = @abcresult.gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "").gsub("\\", "")
elsif content == "url1"
  @abcresult = @abcfull["channel"][0]["item"][1]["link"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ")
elsif content == "name2"
  @abcresult = @abcfull["channel"][0]["item"][2]["title"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ")
elsif content == "description2"
  @abcresult = @abcfull["channel"][0]["item"][2]["description"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ")
    @abcresult = @abcresult.gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "").gsub("\\", "")
elsif content == "url2"
  @abcresult = @abcfull["channel"][0]["item"][2]["link"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ")
elsif content == "name3"
  @abcresult = @abcfull["channel"][0]["item"][3]["title"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ")
elsif content == "description3"
  @abcresult = @abcfull["channel"][0]["item"][3]["description"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ")
    @abcresult = @abcresult.gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "").gsub("\\", "")
elsif content == "url3"
  @abcresult = @abcfull["channel"][0]["item"][3]["link"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ")
elsif content == "name4"
  @abcresult = @abcfull["channel"][0]["item"][4]["title"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ")
elsif content == "description4"
  @abcresult = @abcfull["channel"][0]["item"][4]["description"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ")
    @abcresult = @abcresult.gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "").gsub("\\", "")
elsif content == "url4"
  @abcresult = @abcfull["channel"][0]["item"][4]["link"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ")
elsif content == "name5"
  @abcresult = @abcfull["channel"][0]["item"][5]["title"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ")
elsif content == "description5"
  @abcresult = @abcfull["channel"][0]["item"][5]["description"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ")
    @abcresult = @abcresult.gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "").gsub("\\", "")
elsif content == "url5"
  @abcresult = @abcfull["channel"][0]["item"][5]["link"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ")
end
  return @abcresult
end



@guardianfull = ""

def guardianorig
  # request5 = "https://content.guardianapis.com/search?api-key=d27a9023-524e-4992-9363-d37d4a2a50b9"
  # uri5 = URI(request5)
  # response5 = Net::HTTP.get(uri5)
  # parsedresponse5 = JSON.parse(response5)
  # @guardianfull = parsedresponse5

  request5 = "http://feeds.bbci.co.uk/news/world/us_and_canada/rss.xml"
  uri5 = URI(request5)
  response5 = Net::HTTP.get(uri5)
  data = XmlSimple.xml_in(response5)
  @guardianfull = data

end

def guardian(content)
    @guardianresult = ""
  if content == "name1"
    @guardianresult = @guardianfull["channel"][0]["item"][0]["title"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "").gsub("\\", "")
  elsif content == "description1"
    @guardianresult = @guardianfull["channel"][0]["item"][0]["description"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "").gsub("\\", "")
  elsif content == "url1"
    @guardianresult = @guardianfull["channel"][0]["item"][0]["link"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "").gsub("\\", "")
  elsif content == "name2"
    @guardianresult = @guardianfull["channel"][0]["item"][1]["title"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "").gsub("\\", "")
  elsif content == "description2"
    @guardianresult = @guardianfull["channel"][0]["item"][1]["description"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "").gsub("\\", "")
  elsif content == "url2"
    @guardianresult = @guardianfull["channel"][0]["item"][1]["link"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "").gsub("\\", "")
  elsif content == "name3"
    @guardianresult = @guardianfull["channel"][0]["item"][2]["title"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "").gsub("\\", "")
  elsif content == "description3"
    @guardianresult = @guardianfull["channel"][0]["item"][2]["description"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "").gsub("\\", "")
  elsif content == "url3"
    @guardianresult = @guardianfull["channel"][0]["item"][2]["link"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "").gsub("\\", "")
  elsif content == "name4"
    @guardianresult = @guardianfull["channel"][0]["item"][3]["title"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "").gsub("\\", "")
  elsif content == "description4"
    @guardianresult = @guardianfull["channel"][0]["item"][3]["description"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "").gsub("\\", "")
  elsif content == "url4"
    @guardianresult = @guardianfull["channel"][0]["item"][3]["link"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "").gsub("\\", "")
  elsif content == "name5"
    @guardianresult = @guardianfull["channel"][0]["item"][4]["title"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "").gsub("\\", "")
  elsif content == "description5"
    @guardianresult = @guardianfull["channel"][0]["item"][4]["description"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "").gsub("\\", "")
  elsif content == "url5"
    @guardianresult = @guardianfull["channel"][0]["item"][4]["link"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "").gsub("\\", "")
  end
    return @guardianresult
  end


@bingsearch = ""
def bingorig
  uri = URI('https://api.cognitive.microsoft.com/bing/v5.0/news/search?New-York-NY-10075&5&0&en-us&strict')
  uri.query = URI.encode_www_form({
      # Request parameters
      'Category' => '{string}'
  })

  request = Net::HTTP::Get.new(uri.request_uri)
  # Request headers
  request['Ocp-Apim-Subscription-Key'] = '8b8db9169b3e4e0ebcd010a16c4ce162'
  # Request body
  request.body = "{body}"

  response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
      http.request(request)
  end

  @bingsearch = JSON.parse(response.body)
end

def bing(content)
  @bingresult = ""
if content == "name1"
  @bingresult = @bingsearch["value"][0]["name"]
elsif content == "description1"
  @bingresult = @bingsearch["value"][0]["description"]
elsif content == "url1"
  @bingresult = @bingsearch["value"][0]["url"]
elsif content == "name2"
  @bingresult = @bingsearch["value"][1]["name"]
elsif content == "description2"
  @bingresult = @bingsearch["value"][1]["description"]
elsif content == "url2"
  @bingresult = @bingsearch["value"][1]["url"]
elsif content == "name3"
  @bingresult = @bingsearch["value"][2]["name"]
elsif content == "description3"
  @bingresult = @bingsearch["value"][2]["description"]
elsif content == "url3"
  @bingresult = @bingsearch["value"][2]["url"]
elsif content == "name4"
  @bingresult = @bingsearch["value"][3]["name"]
elsif content == "description4"
  @bingresult = @bingsearch["value"][3]["description"]
elsif content == "url4"
  @bingresult = @bingsearch["value"][3]["url"]
elsif content == "name5"
  @bingresult = @bingsearch["value"][4]["name"]
elsif content == "description5"
  @bingresult = @bingsearch["value"][4]["description"]
elsif content == "url5"
  @bingresult = @bingsearch["value"][4]["url"]
end
  return @bingresult
end


@resultsnyt = ""
def nytorig
  uri = URI("https://api.nytimes.com/svc/topstories/v2/home.json")
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  uri.query = URI.encode_www_form({
    "api-key" => "bfa131c47d404215a477b758674d428b"
  })
  request = Net::HTTP::Get.new(uri.request_uri)
  toparse = http.request(request).body
  @resultsnyt = JSON.parse(toparse)
end

def nyt(aorl1to5)

  # puts result["results"][0]["title"]
  # puts ""
  # puts "Article content: " + result["results"][0]["abstract"]
  # urlofarticle = result["results"][0]["url"]
  result = ""
  puts aorl1to5
  if aorl1to5 == "title1"
    result = @resultsnyt["results"][0]["title"]
  elsif aorl1to5 == "article1"
    result = @resultsnyt["results"][0]["abstract"]
  elsif aorl1to5 == "link1"
    result = @resultsnyt["results"][0]["url"]
  elsif aorl1to5 == "title2"
    result = @resultsnyt["results"][1]["title"]
  elsif aorl1to5 == "article2"
    result = @resultsnyt["results"][1]["abstract"]
  elsif aorl1to5 == "link2"
    result = @resultsnyt["results"][1]["url"]
  elsif aorl1to5 == "title3"
    result = @resultsnyt["results"][2]["title"]
  elsif aorl1to5 == "article3"
    result = @resultsnyt["results"][2]["abstract"]
  elsif aorl1to5 == "link3"
    result = @resultsnyt["results"][2]["url"]
  elsif aorl1to5 == "title4"
    result = @resultsnyt["results"][3]["title"]
  elsif aorl1to5 == "article4"
    result = @resultsnyt["results"][3]["abstract"]
  elsif aorl1to5 == "link4"
    result = @resultsnyt["results"][3]["url"]
  elsif aorl1to5 == "title5"
    result = @resultsnyt["results"][4]["title"]
  elsif aorl1to5 == "article5"
    result = @resultsnyt["results"][4]["abstract"]
  elsif aorl1to5 == "link5"
    result = @resultsnyt["results"][4]["url"]
end
return result
end

def geo_locate_user
  # ip = request.env["HTTP_X_FORWARDED_FOR"]
  # request1 = "http://freegeoip.net/json/#{ip}"
  # uri1 = URI(request1)
  # response1 = Net::HTTP.get(uri1)
  # parsedresponse1 = JSON.parse(response1)
  # p1 = parsedresponse1
  # location = "#{p1["city"]}, #{p1["zip_code"]}"
  return ""
end

def find_city_name



end

def get_location(tweet)
  location = tweet
  location = location.gsub(" ", "-")
  location = location.gsub(",-", ",")
  request1 = "http://api.wunderground.com/api/8d3aaa4df5927f22/conditions/q/#{location}.json"
  puts request1
  uri1 = URI(request1)
  response1 = Net::HTTP.get(uri1)
  parsedresponse1 = JSON.parse(response1)
  p1 = parsedresponse1
  resultlocation = p1["current_observation"]["display_location"]["full"]
end

def get_result(tweet)
  result = getweather(tweet)
end
def get_result_link(tweet)
  resultlink = getweatherlink(tweet)
end
def getweather(tweet)
  location = tweet
  location = location.gsub(" ", "-")
  location = location.gsub(",-", ",")
  request1 = "http://api.wunderground.com/api/8d3aaa4df5927f22/conditions/q/#{location}.json"
  uri1 = URI(request1)
  response1 = Net::HTTP.get(uri1)
  parsedresponse1 = JSON.parse(response1)
  p1 = parsedresponse1
  wind = p1["current_observation"]["wind_mph"].to_f
  windy = ""
  if wind > 10
    windy = "it's windy"
  elsif wind > 5
    windy = "it's a little breezy"
  else
    windy = "it's not too windy"
  end

  request2 = "http://api.wunderground.com/api/8d3aaa4df5927f22/forecast/q/#{location}.json"
  uri2 = URI(request2)
  response2 = Net::HTTP.get(uri2)
  parsedresponse2 = JSON.parse(response2)
  p2 = parsedresponse2
  @result = ""

  add("Here are the current conditions:")
  add("")
  add("It's currently #{p1["current_observation"]["temp_f"]}ºF and #{p1["current_observation"]["weather"]}; the feels like temperature is #{p1["current_observation"]["feelslike_f"]}ºF.")
  add("The UV Index is #{p1["current_observation"]["UV"]}, and #{windy}, with wind speeds at #{p1["current_observation"]["wind_mph"]} mph.")
  add("So far today, there have been #{p1["current_observation"]["precip_today_in"]} inches of rain.")
  add("")
  add("And here's the forecast:")
  add("")

  add("#{p2["forecast"]["txt_forecast"]["forecastday"][0]["title"]} in #{p1["current_observation"]["display_location"]["city"]}")
  add("#{p2["forecast"]["txt_forecast"]["forecastday"][0]["fcttext"]}")
  add("")
  add("#{p2["forecast"]["txt_forecast"]["forecastday"][1]["title"]} in #{p1["current_observation"]["display_location"]["city"]}")
  add("#{p2["forecast"]["txt_forecast"]["forecastday"][1]["fcttext"]}")
  add("")
  add("#{p2["forecast"]["txt_forecast"]["forecastday"][2]["title"]} in #{p1["current_observation"]["display_location"]["city"]}")
  add("#{p2["forecast"]["txt_forecast"]["forecastday"][2]["fcttext"]}")
  add("")
  add("#{p2["forecast"]["txt_forecast"]["forecastday"][3]["title"]} in #{p1["current_observation"]["display_location"]["city"]}")
  add("#{p2["forecast"]["txt_forecast"]["forecastday"][3]["fcttext"]}")
  add("")
  add("#{p2["forecast"]["txt_forecast"]["forecastday"][4]["title"]} in #{p1["current_observation"]["display_location"]["city"]}")
  add("#{p2["forecast"]["txt_forecast"]["forecastday"][4]["fcttext"]}")
  add("")
  add("#{p2["forecast"]["txt_forecast"]["forecastday"][5]["title"]} in #{p1["current_observation"]["display_location"]["city"]}")
  add("#{p2["forecast"]["txt_forecast"]["forecastday"][5]["fcttext"]}")
  # http://api.wunderground.com/api/8d3aaa4df5927f22/forecast/q/CA/San_Francisco.json
  # http://api.wunderground.com/api/8d3aaa4df5927f22/conditions/q/CA/San_Francisco.json
  weatherurl = "https://www.wunderground.com/#{p1["current_observation"]["display_location"]["country"]}/#{p1["current_observation"]["display_location"]["state"]}/#{p1["current_observation"]["display_location"]["city"]}.html"
  return @result
end

def add(addthis)
  if addthis == ""
    addthis = "\n"
  end
  @result = @result + addthis + "\n"
  @result = @result.gsub("\n", "<br>")
end
def getweatherlink(tweet)
  location = tweet
  location = location.gsub(" ", "-")
  location = location.gsub(",-", ",")
  location = location.gsub("_", "+")
  weatherurl = "https://www.wunderground.com/cgi-bin/findweather/getForecast?query=#{location}"
  return weatherurl
end

def getnews
  @result = ""
  uri = URI("https://api.nytimes.com/svc/topstories/v2/home.json")
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  uri.query = URI.encode_www_form({
    "api-key" => "bfa131c47d404215a477b758674d428b"
  })
  request = Net::HTTP::Get.new(uri.request_uri)
  toparse = http.request(request).body
  result = JSON.parse(toparse)
  add(result["results"][0]["title"])
  add("Article content: " + result["results"][0]["abstract"])
  urlofarticle = result["results"][0]["url"]
  request = "https://api-ssl.bitly.com/v3/shorten?access_token=83b940bc0867c8a99408252cf2c5c46ee7501dc8&longUrl=#{urlofarticle}"
  uri = URI(request)
  response = Net::HTTP.get(uri)
  response = JSON.parse(response)
  shortlink = response["data"]["url"]
  shortlink = shortlink.to_s.gsub("http://", "")
  add("Link to full article: #{shortlink}")

  add("")
  add(result["results"][1]["title"])
  add("Article content: " + result["results"][1]["abstract"])
  urlofarticle = result["results"][1]["url"]
  request = "https://api-ssl.bitly.com/v3/shorten?access_token=83b940bc0867c8a99408252cf2c5c46ee7501dc8&longUrl=#{urlofarticle}"
  uri = URI(request)
  response = Net::HTTP.get(uri)
  response = JSON.parse(response)
  shortlink = response["data"]["url"]
  shortlink = shortlink.to_s.gsub("http://", "")
  add("Link to full article: #{shortlink}")
  add("")
  add(result["results"][2]["title"])
  add("Article content: " + result["results"][2]["abstract"])
  urlofarticle = result["results"][2]["url"]
  request = "https://api-ssl.bitly.com/v3/shorten?access_token=83b940bc0867c8a99408252cf2c5c46ee7501dc8&longUrl=#{urlofarticle}"
  uri = URI(request)
  response = Net::HTTP.get(uri)
  response = JSON.parse(response)
  shortlink = response["data"]["url"]
  shortlink = shortlink.to_s.gsub("http://", "")
  add("Link to full article: #{shortlink}")
  add("")
  add(result["results"][3]["title"])
  add("Article content: " + result["results"][3]["abstract"])
  urlofarticle = result["results"][3]["url"]
  request = "https://api-ssl.bitly.com/v3/shorten?access_token=83b940bc0867c8a99408252cf2c5c46ee7501dc8&longUrl=#{urlofarticle}"
  uri = URI(request)
  response = Net::HTTP.get(uri)
  response = JSON.parse(response)
  shortlink = response["data"]["url"]
  shortlink = shortlink.to_s.gsub("http://", "")
  add("Link to full article: #{shortlink}")

  add("")
  add("All content copyright The New York Times.")
end






def zipcodetocity(zipcode)
  zip = zipcode.to_s
  city = @@zipshash[zip][:city]
  puts city
  return city.gsub(" ", "%20")
end

def zipcodetolong(zipcode)
  zip = zipcode.to_s
  long = @@zipshash[zip][:long]
end

def zipcodetolat(zipcode)
  zip = zipcode.to_s
  lat = @@zipshash[zip][:lat]
end

def savezip(zip)
session[:zipcode] = zip
end

def savename(name)
  session[:name] = name
end

def findtime(latlong)
  # lat=47.01&lng=10.2
  puts latlong

  request5 = "http://api.geonames.org/timezone?#{latlong}&username=owlswipe"
  uri5 = URI(request5)
  response5 = Net::HTTP.get(uri5)
  data = XmlSimple.xml_in(response5)
  result = data["timezone"][0]["time"][0].split(' ')[1]
  puts result
  return result
end
