require 'net/http'
require 'json'
require 'rubygems'
require 'rexml/document'
require 'xmlsimple'

@engadgetfull = ""

def engadgetorig
  begin
  request5 = "https://www.engadget.com/rss.xml"
  uri5 = URI(request5)
  response5 = Net::HTTP.get(uri5)
  data = XmlSimple.xml_in(response5)
  @engadgetfull = data
  rescue
  @engadgetfull = ""
  end
end

def engadget(content)
  @engadgetresult = ""
if content == "name1"
  begin
  @engadgetresult = @engadgetfull["channel"][0]["item"][0]["title"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&agrave;", "á ").gsub("\n", " ")
  rescue
  @engadgetresult = "Something went wrong."
  end
elsif content == "description1"
  begin
  description1 = @engadgetfull["channel"][0]["item"][0]["description"].to_s
  @engadgetresult = description1.gsub("\n", "a").split(">")[1].split("..")[0].gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("\n", " ").gsub("&amp;", "&") + "..."
  @engadgetresult = @engadgetresult.gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "").gsub("By Cat DiStasio", "")
  rescue
  @engadgetresult = "Unfortunately, Engadget didn't send any news data. It's probably an issue on their end, but please contact me if the issue persists."
  end
elsif content == "url1"
  begin
  @engadgetresult = @engadgetfull["channel"][0]["item"][0]["link"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&agrave;", "á ").gsub("\n", " ").gsub("&amp;", "&")
  rescue
  @engadgetresult = "Something went wrong."
  end
elsif content == "name2"
  begin
  @engadgetresult = @engadgetfull["channel"][0]["item"][1]["title"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&agrave;", "á ").gsub("\n", " ").gsub("&amp;", "&")
  rescue
  @engadgetresult = "Something went wrong."
  end
elsif content == "description2"
  begin
  description2 = @engadgetfull["channel"][0]["item"][1]["description"].to_s
  @engadgetresult = description2.split(">")[1].split("..")[0].gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("\n", " ").gsub("&amp;", "&")  + "..."
  @engadgetresult = @engadgetresult.gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "").gsub("By Cat DiStasio", "")
  rescue
  @engadgetresult = ""
  end
elsif content == "url2"
  begin
  @engadgetresult = @engadgetfull["channel"][0]["item"][1]["link"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&agrave;", "á ").gsub("\n", " ").gsub("&amp;", "&")
  rescue
  @engadgetresult = "Something went wrong."
  end
elsif content == "name3"
  begin
  @engadgetresult = @engadgetfull["channel"][0]["item"][2]["title"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&agrave;", "á ").gsub("\n", " ").gsub("&amp;", "&")
  rescue
  @engadgetresult = "Something went wrong."
  end
elsif content == "description3"
  begin
  description3 = @engadgetfull["channel"][0]["item"][2]["description"].to_s
  @engadgetresult = description3.split(">")[1].split("..")[0].gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("\n", " ").gsub("&amp;", "&")  + "..."
  @engadgetresult = @engadgetresult.gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "").gsub("By Cat DiStasio", "")
  rescue
  @engadgetresult = ""
  end
elsif content == "url3"
  begin
  @engadgetresult = @engadgetfull["channel"][0]["item"][2]["link"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&agrave;", "á ").gsub("\n", " ").gsub("&amp;", "&")
  rescue
  @engadgetresult = "Something went wrong."
  end
elsif content == "name4"
  begin
  @engadgetresult = @engadgetfull["channel"][0]["item"][3]["title"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&agrave;", "á ").gsub("\n", " ").gsub("&amp;", "&")
  rescue
  @engadgetresult = "Something went wrong."
  end
elsif content == "description4"
  begin
  description4 = @engadgetfull["channel"][0]["item"][3]["description"].to_s
  @engadgetresult = description4.split(">")[1].split("..")[0].gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("\n", " ").gsub("&amp;", "&")  + "..."
  @engadgetresult = @engadgetresult.gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "").gsub("By Cat DiStasio", "")
  rescue
  @engadgetresult = ""
  end
elsif content == "url4"
  begin
  @engadgetresult = @engadgetfull["channel"][0]["item"][3]["link"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&agrave;", "á ").gsub("\n", " ").gsub("&amp;", "&")
  rescue
  @engadgetresult = "Something went wrong."
  end
elsif content == "name5"
  begin
  @engadgetresult = @engadgetfull["channel"][0]["item"][4]["title"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&agrave;", "á ").gsub("\n", " ").gsub("&amp;", "&")
  rescue
  @engadgetresult = "Something went wrong."
  end
elsif content == "description5"
  begin
  description5 = @engadgetfull["channel"][0]["item"][4]["description"].to_s
  @engadgetresult = description5.split(">")[1].split("..")[0].gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("\n", " ").gsub("&amp;", "&")  + "..."
  @engadgetresult = @engadgetresult.gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "").gsub("By Cat DiStasio", "")
  rescue
  @engadgetresult = ""
  end
elsif content == "url5"
  begin
  @engadgetresult = @engadgetfull["channel"][0]["item"][4]["link"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&agrave;", "á ").gsub("\n", " ").gsub("&amp;", "&")
  rescue
  @engadgetresult = "Something went wrong."
  end
end
  return @engadgetresult
end


@abcfull = ""

def abcorig
  # this is the request that calls the Australian Broadcasting Company request4 = "http://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://www.abc.net.au/news/feed/51120/rss.json&num=10"
  begin
  request4 = "http://feeds.abcnews.com/abcnews/topstories"
  uri4 = URI(request4)
  response4 = Net::HTTP.get(uri4)
  data = XmlSimple.xml_in(response4)
  @abcfull = data
  rescue
  @abcfull = ""
  end
end

def abc(content)
  @abcresult = ""
if content == "name1"
  begin
  @abcresult = @abcfull["channel"][0]["item"][1]["title"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("u2019", "\'")
  rescue
  @abcresult = "Something went wrong."
  end
elsif content == "description1"
  begin
  @abcresult = @abcfull["channel"][0]["item"][1]["description"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("u2019", "\'")
  @abcresult = @abcresult.gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "").gsub("\\", "")
  rescue
  @abcresult = "Unfortunately, ABC News didn't send any news data. It's probably an issue on their end, but please contact me if the issue persists."
  end
elsif content == "url1"
  begin
  @abcresult = @abcfull["channel"][0]["item"][1]["link"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("u2019", "\'")
  rescue
  @abcresult = "Something went wrong."
  end
elsif content == "name2"
  begin
  @abcresult = @abcfull["channel"][0]["item"][2]["title"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("u2019", "\'")
  rescue
  @abcresult = "Something went wrong."
  end
elsif content == "description2"
  begin
  @abcresult = @abcfull["channel"][0]["item"][2]["description"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("u2019", "\'")
    @abcresult = @abcresult.gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "").gsub("\\", "")
    rescue
  @abcresult = ""
    end
elsif content == "url2"
  begin
  @abcresult = @abcfull["channel"][0]["item"][2]["link"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("u2019", "\'")
  rescue
  @abcresult = "Something went wrong."
  end
elsif content == "name3"
  begin
  @abcresult = @abcfull["channel"][0]["item"][3]["title"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("u2019", "\'")
  rescue
  @abcresult = "Something went wrong."
  end
elsif content == "description3"
  begin
  @abcresult = @abcfull["channel"][0]["item"][3]["description"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("u2019", "\'")
    @abcresult = @abcresult.gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "").gsub("\\", "")
    rescue
  @abcresult = ""
    end
elsif content == "url3"
  begin
  @abcresult = @abcfull["channel"][0]["item"][3]["link"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("u2019", "\'")
  rescue
  @abcresult = "Something went wrong."
  end
elsif content == "name4"
  begin
  @abcresult = @abcfull["channel"][0]["item"][4]["title"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("u2019", "\'")
  rescue
  @abcresult = "Something went wrong."
  end
elsif content == "description4"
  begin
  @abcresult = @abcfull["channel"][0]["item"][4]["description"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("u2019", "\'")
    @abcresult = @abcresult.gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "").gsub("\\", "")
    rescue
  @abcresult = ""
    end
elsif content == "url4"
  begin
  @abcresult = @abcfull["channel"][0]["item"][4]["link"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("u2019", "\'")
  rescue
  @abcresult = "Something went wrong."
  end
elsif content == "name5"
  begin
  @abcresult = @abcfull["channel"][0]["item"][5]["title"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("u2019", "\'")
  rescue
  @abcresult = "Something went wrong."
  end
elsif content == "description5"
  begin
  @abcresult = @abcfull["channel"][0]["item"][5]["description"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("u2019", "\'")
    @abcresult = @abcresult.gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "").gsub("\\", "")
    rescue
  @abcresult = ""
    end
elsif content == "url5"
  begin
  @abcresult = @abcfull["channel"][0]["item"][5]["link"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("u2019", "\'")
  rescue
  @abcresult = "Something went wrong."
  end
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
  begin
  request5 = "http://feeds.bbci.co.uk/news/world/us_and_canada/rss.xml"
  uri5 = URI(request5)
  response5 = Net::HTTP.get(uri5)
  data = XmlSimple.xml_in(response5)
  @guardianfull = data
  rescue
  @guardianfull = ""
  end
end

def guardian(content)
    @guardianresult = ""
  if content == "name1"
    begin
    @guardianresult = @guardianfull["channel"][0]["item"][0]["title"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "").gsub("\\", "").gsub("u00A", "£")
    rescue
    @guardianresult = "Something went wrong."
    end
  elsif content == "description1"
    begin
    @guardianresult = @guardianfull["channel"][0]["item"][0]["description"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "").gsub("\\", "").gsub("u00A", "£")
    rescue
    @guardianresult = "Unfortunately, BBC News didn't send any news data. It's probably an issue on their end, but please contact me if the issue persists."
    end
  elsif content == "url1"
    begin
    @guardianresult = @guardianfull["channel"][0]["item"][0]["link"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "").gsub("\\", "").gsub("u00A", "£")
    rescue
    @guardianresult = "Something went wrong."
    end
  elsif content == "name2"
    begin
    @guardianresult = @guardianfull["channel"][0]["item"][1]["title"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "").gsub("\\", "").gsub("u00A", "£")
    rescue
    @guardianresult = "Something went wrong."
    end
  elsif content == "description2"
    begin
    @guardianresult = @guardianfull["channel"][0]["item"][1]["description"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "").gsub("\\", "").gsub("u00A", "£")
    rescue
    @guardianresult = ""
    end
  elsif content == "url2"
    begin
    @guardianresult = @guardianfull["channel"][0]["item"][1]["link"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "").gsub("\\", "").gsub("u00A", "£")
    rescue
    @guardianresult = "Something went wrong."
    end
  elsif content == "name3"
    begin
    @guardianresult = @guardianfull["channel"][0]["item"][2]["title"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "").gsub("\\", "").gsub("u00A", "£")
    rescue
    @guardianresult = "Something went wrong."
    end
  elsif content == "description3"
    begin
    @guardianresult = @guardianfull["channel"][0]["item"][2]["description"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "").gsub("\\", "").gsub("u00A", "£")
    rescue
    @guardianresult = ""
    end
  elsif content == "url3"
    begin
    @guardianresult = @guardianfull["channel"][0]["item"][2]["link"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "").gsub("\\", "").gsub("u00A", "£")
    rescue
    @guardianresult = "Something went wrong."
    end
  elsif content == "name4"
    begin
    @guardianresult = @guardianfull["channel"][0]["item"][3]["title"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "").gsub("\\", "").gsub("u00A", "£")
    rescue
    @guardianresult = "Something went wrong."
    end
  elsif content == "description4"
    begin
    @guardianresult = @guardianfull["channel"][0]["item"][3]["description"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "").gsub("\\", "").gsub("u00A", "£")
    rescue
    @guardianresult = ""
    end
  elsif content == "url4"
    begin
    @guardianresult = @guardianfull["channel"][0]["item"][3]["link"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "").gsub("\\", "").gsub("u00A", "£")
    rescue
    @guardianresult = "Something went wrong."
    end
  elsif content == "name5"
    begin
    @guardianresult = @guardianfull["channel"][0]["item"][4]["title"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "").gsub("\\", "").gsub("u00A", "£")
    rescue
    @guardianresult = "Something went wrong."
    end
  elsif content == "description5"
    begin
    @guardianresult = @guardianfull["channel"][0]["item"][4]["description"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "").gsub("\\", "").gsub("u00A", "£")
    rescue
    @guardianresult = ""
    end
  elsif content == "url5"
    begin
    @guardianresult = @guardianfull["channel"][0]["item"][4]["link"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "").gsub("\\", "").gsub("u00A", "£")
    rescue
    @guardianresult = "Something went wrong."
    end
  end
    return @guardianresult
  end


@foxsportsfull = ""
def foxsportsorig
  begin
  request6 = "https://api.foxsports.com/v1/rss?partnerKey=zBaFxRyGKCfxBagJG9b8pqLyndmvo7UU"
  uri6 = URI(request6)
  response6 = Net::HTTP.get(uri6)
  data = XmlSimple.xml_in(response6)
  @foxsportsfull = data
  rescue
  @foxsportsfull = ""
  end
end

def foxsports(content)
  @foxsportsresult = ""
if content == "name1"
  begin
  @foxsportsresult = @foxsportsfull["channel"][0]["item"][0]["title"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "").gsub("\\", "").gsub("Continue reading&hellip;", "")
  rescue
  @foxsportsresult = "Something went wrong."
  end
elsif content == "description1"
  begin
  @foxsportsresult = @foxsportsfull["channel"][0]["item"][0]["description"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "").gsub("\\", "").gsub("Continue reading&hellip;", "").gsub(" (AP)", ":")
  rescue
  @foxsportsresult = "Unfortunately, Fox Sports didn't send any news data. It's probably an issue on their end, but please contact me if the issue persists."
  end
elsif content == "url1"
  begin
  @foxsportsresult = @foxsportsfull["channel"][0]["item"][0]["link"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "").gsub("\\", "").gsub("Continue reading&hellip;", "")
  rescue
  @foxsportsresult = "Something went wrong."
  end
elsif content == "name2"
  begin
  @foxsportsresult = @foxsportsfull["channel"][0]["item"][1]["title"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "").gsub("\\", "").gsub("Continue reading&hellip;", "")
  rescue
  @foxsportsresult = "Something went wrong."
  end
elsif content == "description2"
  begin
  @foxsportsresult = @foxsportsfull["channel"][0]["item"][1]["description"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "").gsub("\\", "").gsub("Continue reading&hellip;", "").gsub(" (AP)", ":")
  rescue
  @foxsportsresult = ""
  end
elsif content == "url2"
  begin
  @foxsportsresult = @foxsportsfull["channel"][0]["item"][1]["link"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "").gsub("\\", "").gsub("Continue reading&hellip;", "")
  rescue
  @foxsportsresult = "Something went wrong."
  end
elsif content == "name3"
  begin
  @foxsportsresult = @foxsportsfull["channel"][0]["item"][2]["title"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "").gsub("\\", "").gsub("Continue reading&hellip;", "")
  rescue
  @foxsportsresult = "Something went wrong."
  end
elsif content == "description3"
  begin
  @foxsportsresult = @foxsportsfull["channel"][0]["item"][2]["description"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "").gsub("\\", "").gsub("Continue reading&hellip;", "").gsub(" (AP)", ":")
  rescue
  @foxsportsresult = ""
  end
elsif content == "url3"
  begin
  @foxsportsresult = @foxsportsfull["channel"][0]["item"][2]["link"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "").gsub("\\", "").gsub("Continue reading&hellip;", "")
  rescue
  @foxsportsresult = "Something went wrong."
  end
elsif content == "name4"
  begin
  @foxsportsresult = @foxsportsfull["channel"][0]["item"][3]["title"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "").gsub("\\", "").gsub("Continue reading&hellip;", "")
  rescue
  @foxsportsresult = "Something went wrong."
  end
elsif content == "description4"
  begin
  @foxsportsresult = @foxsportsfull["channel"][0]["item"][3]["description"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "").gsub("\\", "").gsub("Continue reading&hellip;", "").gsub(" (AP)", ":")
  rescue
  @foxsportsresult = ""
  end
elsif content == "url4"
  begin
  @foxsportsresult = @foxsportsfull["channel"][0]["item"][3]["link"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "").gsub("\\", "").gsub("Continue reading&hellip;", "")
  rescue
  @foxsportsresult = "Something went wrong."
  end
elsif content == "name5"
  begin
  @foxsportsresult = @foxsportsfull["channel"][0]["item"][4]["title"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "").gsub("\\", "").gsub("Continue reading&hellip;", "")
  rescue
  @foxsportsresult = "Something went wrong."
  end
elsif content == "description5"
  begin
  @foxsportsresult = @foxsportsfull["channel"][0]["item"][4]["description"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "").gsub("\\", "").gsub("Continue reading&hellip;", "").gsub(" (AP)", ":")
  rescue
  @foxsportsresult = ""
  end
elsif content == "url5"
  begin
  @foxsportsresult = @foxsportsfull["channel"][0]["item"][4]["link"].to_s.gsub("[\"", "").gsub("\"]", "").gsub("&quot;", "\"").gsub("&#039;", "\'").gsub("&agrave;", "á ").gsub("\\n", "").gsub("\\t", "").gsub("\"]...", "").gsub("\\", "").gsub("Continue reading&hellip;", "")
  rescue
  @foxsportsresult = "Something went wrong."
  end
end
  return @foxsportsresult
end


@resultsnyt = ""
def nytorig
  begin
  puts "starting nytimes load"
  uri = URI("https://api.nytimes.com/svc/topstories/v2/home.json")
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  uri.query = URI.encode_www_form({
    "api-key" => "bfa131c47d404215a477b758674d428b"
  })
  request = Net::HTTP::Get.new(uri.request_uri)
  toparse = http.request(request).body
  @resultsnyt = JSON.parse(toparse)
  puts "finished nytimes load"
  rescue
  @resultsnyt = ""
  end
end

def nyt(aorl1to5)
  result = ""
  if aorl1to5 == "title1"
    begin
    result = @resultsnyt["results"][0]["title"]
    rescue
    result = "Something went wrong."
    end
  elsif aorl1to5 == "article1"
    begin
    result = @resultsnyt["results"][0]["abstract"]
    rescue
    result = "Unfortunately, The New York Times didn't send any news data. It's probably an issue on their end, but please contact me if the issue persists."
    end
  elsif aorl1to5 == "link1"
    begin
    result = @resultsnyt["results"][0]["url"]
    rescue
    result = "Something went wrong."
    end
  elsif aorl1to5 == "title2"
    begin
    result = @resultsnyt["results"][1]["title"]
    rescue
    result = "Something went wrong."
    end
  elsif aorl1to5 == "article2"
    begin
    result = @resultsnyt["results"][1]["abstract"]
    rescue
    result = ""
    end
  elsif aorl1to5 == "link2"
    begin
    result = @resultsnyt["results"][1]["url"]
    rescue
    result = "Something went wrong."
    end
  elsif aorl1to5 == "title3"
    begin
    result = @resultsnyt["results"][2]["title"]
    rescue
    result = "Something went wrong."
    end
  elsif aorl1to5 == "article3"
    begin
    result = @resultsnyt["results"][2]["abstract"]
    rescue
    result = ""
    end
  elsif aorl1to5 == "link3"
    begin
    result = @resultsnyt["results"][2]["url"]
    rescue
    result = "Something went wrong."
    end
  elsif aorl1to5 == "title4"
    begin
    result = @resultsnyt["results"][3]["title"]
    rescue
    result = "Something went wrong."
    end
  elsif aorl1to5 == "article4"
    begin
    result = @resultsnyt["results"][3]["abstract"]
    rescue
    result = ""
    end
  elsif aorl1to5 == "link4"
    begin
    result = @resultsnyt["results"][3]["url"]
    rescue
    result = "Something went wrong."
    end
  elsif aorl1to5 == "title5"
    begin
    result = @resultsnyt["results"][4]["title"]
    rescue
    result = "Something went wrong."
    end
  elsif aorl1to5 == "article5"
    begin
    result = @resultsnyt["results"][4]["abstract"]
    rescue
    result = ""
    end
  elsif aorl1to5 == "link5"
    begin      
    result = @resultsnyt["results"][4]["url"]
    rescue
    result = "Something went wrong."
    end
    
end
return result
end

def get_location(tweet)
  location = tweet
  location = location.gsub(" ", "-")
  location = location.gsub(",-", ",")
  request1 = "http://api.wunderground.com/api/8d3aaa4df5927f22/conditions/q/#{location}.json"
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
  gmaprequest = "http://maps.googleapis.com/maps/api/geocode/json?address=" + zipcode + "&sensor=false"
  urigmap = URI(gmaprequest)
  responsegmap = Net::HTTP.get(urigmap)
  @resultsgmap = JSON.parse(responsegmap)
  @resultingcity = @resultsgmap["results"][0]["address_components"][1]["long_name"]
  return @resultingcity.gsub(" ", "%20")
end

def zipcodetolong(zipcode)
  gmaprequest = "http://maps.googleapis.com/maps/api/geocode/json?address=" + zipcode + "&sensor=false"
  urigmap = URI(gmaprequest)
  responsegmap = Net::HTTP.get(urigmap)
  @resultsgmap = JSON.parse(responsegmap)
  long = @resultsgmap["results"][0]["geometry"]["location"]["lng"]
end

def zipcodetolat(zipcode)
  gmaprequest = "http://maps.googleapis.com/maps/api/geocode/json?address=" + zipcode + "&sensor=false"
  urigmap = URI(gmaprequest)
  responsegmap = Net::HTTP.get(urigmap)
  @resultsgmap = JSON.parse(responsegmap)
  @lat = @resultsgmap["results"][0]["geometry"]["location"]["lat"]
end

def savezip(zip)
  # response.set_cookie 'zipcode',
    # {:value=> zip, :max_age => "31556926"}
end

def savename(name)
  @theusername = name
  # response.set_cookie 'name',
    # {:value=> name, :max_age => "31556926"}
end

def saveisfirstrun()
    puts "saveisfirstrun called."
    if request.cookies['isfirstrun']
    puts "found isfirstrun cookie"
    # may have used already
    if request.cookies['isfirstrun'] == "true"
    puts "isfirstrun is true"
    # reset and may have used already
    if request.cookies['previousname']
    puts "found previousname cookie"
    if request.cookies['previousname'] == @theusername
    puts "previousname matches name, setting welcomearray to [Welcome, Hello, Nice to see you,...]"
    puts "previousname is " + request.cookies['previousname']
    puts "name is " + @theusername
    # have used before
    @welcomearray = ["Welcome", "Hello", "Nice to see you", "Welcome back", "Hey", "Great to see you again", "Glad you're back", "Happy to see you again", "Welcome", "Hello"]
    else
    puts "previousname does not match name, setting welcomearray to [Nice to meet you]."
    puts "previousname is " + request.cookies['previousname']
    puts "name is " + @theusername
    # have not used before
    @welcomearray = ["Welcome"]
    end
    puts "setting isfirstrun to false"
    response.set_cookie 'isfirstrun',
      {:value=> "false", :max_age => "31556926"}
    end
    else
    puts "isfirstrun is false, setting welcomearray to [Welcome, Hello, Nice to See You,...]"
    # have used already
    @welcomearray = ["Welcome", "Hello", "Nice to see you", "Welcome back", "Hey", "Great to see you again", "Glad you're back", "Happy to see you again", "Welcome", "Hello"]
    end
    else
    puts "failed to find isfirstrun so it's really the first run, setting welcomearray to [Nice to meet you]"
    if request.cookies['name']
    # if cookies are working, so they really haven't used before
    @welcomearray = ["Nice to meet you"]
    else
    # if cookies are disabled, so not sure if they have used before or not
    @welcomearray = ["Welcome"]
    end
    response.set_cookie 'isfirstrun',
      {:value=> "false", :max_age => "31556926"}
    puts "set isfirstrun to false"
    end
    puts "done with saveisfirstrun."
end

def findtime(latlong)
  # lat=47.01&lng=10.2
 begin
  request5 = "http://api.geonames.org/timezone?#{latlong}&username=owlswipe"
  uri5 = URI(request5)
  response5 = Net::HTTP.get(uri5)
  data = XmlSimple.xml_in(response5)
  result = data["timezone"][0]["time"][0].split(' ')[1]
  return result
 rescue
  return "unknown time"
 end
end
