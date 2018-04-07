require 'bundler'
require 'net/http'
require 'json'
require 'rubygems'
require 'rexml/document'
require 'xmlsimple'
require 'date'

Bundler.require
require_relative 'models/model.rb'

class MyApp < Sinatra::Base
  use Rack::Session::Cookie, :key => 'rack.session',
                           :path => '/',
                           :secret => 'seeeeeecret'


  def date_of_next(day)
  date  = Date.parse(day)
  delta = date > Date.today ? 0 : 7
  date + delta
  end


  get '/' do
    if request.cookies['name'] && request.cookies['zipcode'] != "reset"
    redirect "/newsfeed"
    elsif request.cookies['name']
    @username = request.cookies['name']
    end
    erb :index
  end


  get '/bookmark' do
    @bookmark = true
    redirect "/"
  end

  get '/ordyrlivedata' do
    erb :ordyrlive
  end

  post '/daltonmenuaction' do
      @m2 = ""
      @m3 = ""
      @m4 = "" 
      @m5 = ""
      url1 = "hi"
  begin
  headers "Content-Type" => "application/json"
  begin
   request.body.rewind
   @request_payload = JSON.parse request.body.read
    @tomorrow = "today"
    if @request_payload["result"]["resolvedQuery"].to_s.include? "tomorrow"
       @tomorrow = "tomorrow"
    elsif @request_payload["result"]["resolvedQuery"].to_s.include? "monday" 
       @tomorrow = "Monday"
    elsif @request_payload["result"]["resolvedQuery"].to_s.include? "tuesday"
       @tomorrow = "Tuesday"
    elsif @request_payload["result"]["resolvedQuery"].to_s.include? "wednesday"
       @tomorrow = "Wednesday"
    elsif @request_payload["result"]["resolvedQuery"].to_s.include? "thursday"
       @tomorrow = "Thursday"
    elsif @request_payload["result"]["resolvedQuery"].to_s.include? "friday"
       @tomorrow = "Friday"
    elsif @request_payload["result"]["resolvedQuery"].to_s.include? "Monday" 
       @tomorrow = "Monday"
    elsif @request_payload["result"]["resolvedQuery"].to_s.include? "Tuesday"
       @tomorrow = "Tuesday"
    elsif @request_payload["result"]["resolvedQuery"].to_s.include? "Wednesday"
       @tomorrow = "Wednesday"
    elsif @request_payload["result"]["resolvedQuery"].to_s.include? "Thursday"
       @tomorrow = "Thursday"
    elsif @request_payload["result"]["resolvedQuery"].to_s.include? "Friday"
       @tomorrow = "Friday"
    end
  rescue 
    @tomorrow = "today"
  end
      theday = Time.now.getlocal('-07:00').to_date
      if @tomorrow == "tomorrow"
        theday = theday + 1
      end
      if @tomorrow == "Monday"
        theday = date_of_next "Monday"
      end
      if @tomorrow == "Tuesday"
        theday = date_of_next "Tuesday"
      end
      if @tomorrow == "Wednesday"
        theday = date_of_next "Wednesday"
      end
      if @tomorrow == "Thursday"
        theday = date_of_next "Thursday"
      end
      if @tomorrow == "Friday"
        theday = date_of_next "Friday"
      end


      year = theday.year.to_i - 2000 # will break in 2100 oops
      month = theday.month.to_i
      day = theday.day.to_i
      begin
      url1 = "http://206.82.192.168/v2/menu/" + month.to_s + "/" + day.to_s + "/" + year.to_s + "/app/bigdalton?callback=angular.callbacks._6&key=3D895734-2271-4563-8332-AB943B2E9CAF&siteID=538277448587fc0fd60006fd"
      uri1 = URI(url1)
      response1 = Net::HTTP.get(uri1)
      parsedresponse1 = JSON.parse(response1.gsub("/**/angular.callbacks._6", "").gsub(")", "").gsub("(", ""))
      @m1 = "• " + parsedresponse1["meal periods"][0]["menu items"][0]["name"].to_s.split("Contains").first
      @m1speak = @m1 + ".\n"
      @m1contains = ""
      begin
        @m1contains = parsedresponse1["meal periods"][0]["menu items"][0]["name"].to_s.split("Contains")[1]
        @m1 = @m1 + "(" + @m1contains.gsub("Contains", "") + ")" + "\n"
      rescue
        @m1 = @m1 + "\n"
      end
      @m2 = "• " + parsedresponse1["meal periods"][0]["menu items"][1]["name"].to_s.split("Contains").first
      @m2speak = @m2 + ".\n"
      @m2contains = ""
      begin
        @m2contains = parsedresponse1["meal periods"][0]["menu items"][1]["name"].to_s.split("Contains")[1]
        @m2 = @m2 + "(" + @m2contains.gsub("Contains", "") + ")" + "\n"
      rescue
        @m2 = @m2 + "\n"
      end
      @m3 = "• " + parsedresponse1["meal periods"][0]["menu items"][2]["name"].to_s.split("Contains").first
      @m3speak = @m3 + ".\n"
      @m3contains = ""
      begin
        @m3contains = parsedresponse1["meal periods"][0]["menu items"][2]["name"].to_s.split("Contains")[1]
        @m3 = @m3 + "(" + @m3contains.gsub("Contains", "") + ")" + "\n"
      rescue
        @m3 = @m3 + "\n"
      end
      @m4 = "• " + parsedresponse1["meal periods"][0]["menu items"][3]["name"].to_s.split("Contains").first
      @m4speak = @m4 + ".\n"
      @m4contains = ""
      begin
        @m4contains = parsedresponse1["meal periods"][0]["menu items"][3]["name"].to_s.split("Contains")[1]
        @m4 = @m4 + "(" + @m4contains.gsub("Contains", "") + ")" + "\n"
      rescue
        @m4 = @m4 + "\n"
      end
      @m5 = "• " + parsedresponse1["meal periods"][0]["menu items"][4]["name"].to_s.split("Contains").first
      @m5speak = @m5 + ".\n"
      @m5contains = ""
      begin
        @m5contains = parsedresponse1["meal periods"][0]["menu items"][4]["name"].to_s.split("Contains")[1]
        @m5 = @m5 + "(" + @m5contains.gsub("Contains", "") + ")" + "\n"
      rescue
        @m5 = @m5 + "\n"
      end
      @m7 = "• " + parsedresponse1["meal periods"][0]["menu items"][5]["name"].to_s.split("Contains").first
      @m7speak = @m7 + ".\n"
      @m7contains = ""
      begin
        @m7contains = parsedresponse1["meal periods"][0]["menu items"][5]["name"].to_s.split("Contains")[1]
        @m7 = @m7 + "(" + @m7contains.gsub("Contains", "") + ")" + "\n"
      rescue
        @m7 = @m7 + "\n"
      end
      @m8 = "• " + parsedresponse1["meal periods"][0]["menu items"][6]["name"].to_s.split("Contains").first
      @m8speak = @m8 + ".\n"
      @m8contains = ""
      begin
        @m8contains = parsedresponse1["meal periods"][0]["menu items"][6]["name"].to_s.split("Contains")[1]
        @m8 = @m8 + "(" + @m8contains.gsub("Contains", "") + ")" + "\n"
      rescue
        @m8 = @m8 + "\n"
      end
      @m9 = "• " + parsedresponse1["meal periods"][0]["menu items"][7]["name"].to_s.split("Contains").first
      @m9speak = @m9 + ".\n"
      @m9contains = ""
      begin
        @m9contains = parsedresponse1["meal periods"][0]["menu items"][7]["name"].to_s.split("Contains")[1]
        @m9 = @m9 + "(" + @m9contains.gsub("Contains", "") + ")"
      rescue
        @m9 = @m9 # no line break for last line
      end
      @m6 = "On the menu " + @tomorrow + " at Dalton are:\n" + @m1 + @m2 + @m3 + @m4 + @m5 + @m7 + @m8 + @m9
      @m6 = @m6.gsub(" ,", ",").gsub(" .", ".").gsub("( ", "(").gsub(" )", ")")
      @m6speak = "On the menu " + @tomorrow + " at Dalton are:\n" + @m1speak + @m2speak + @m3speak + @m4speak + @m5speak + @m7speak + @m8speak + "and\n" + @m9speak + "Want to know anything else?"
      erb :daltonmenuaction
      rescue
      @m1 = "No meal today!"
      erb :daltonmenuactionfailure
      end
    rescue
    end
  end


      # @m1 = parsedresponse1["meal periods"][0]["menu items"][0]["name"].to_s.split("Contains").first + ", "
      # @m2 = parsedresponse1["meal periods"][0]["menu items"][1]["name"].to_s.split("Contains").first + ", "
      # @m3 = parsedresponse1["meal periods"][0]["menu items"][2]["name"].to_s.split("Contains").first + ", "
      # @m4 = parsedresponse1["meal periods"][0]["menu items"][3]["name"].to_s.split("Contains").first + ", "
      # @m5 = parsedresponse1["meal periods"][0]["menu items"][4]["name"].to_s.split("Contains").first + ", "
      # @m7 = parsedresponse1["meal periods"][0]["menu items"][5]["name"].to_s.split("Contains").first + ", and "
      # @m8 = parsedresponse1["meal periods"][0]["menu items"][6]["name"].to_s.split("Contains").first + "."
      # @m6 = "On the menu " + @tomorrow + " at Dalton are " + @m1 + @m2 + @m3 + @m4 + @m5 + @m7 + " Want to know anything else?"




  get '/retry' do
    if session[:fail]
      @reason = session[:fail]
    end
    erb :retry
  end

  get '/setup' do
    if request.cookies['name']
    response.set_cookie 'previousname',
    {:value=> request.cookies['name'], :max_age => "31556926"}
  end
    response.set_cookie 'zipcode',
      {:value=> "reset", :max_age => "31556926"}
      response.set_cookie 'isfirstrun',
        {:value=> "true", :max_age => "31556926"}
    redirect "/"
  end

  get '/Something%20went%20wrong.' do
    redirect "/"
  end

  get '/submit' do
    puts "url is now " + request.url
    uri = URI.parse(request.url.to_s)
    uri.query
    paramHash = Hash[URI.decode_www_form(uri.query)] # => {"id"=>"john"}
    @nocookiefirstname = paramHash['first_name']
    @nocookiezipcode = paramHash['zip_code']
    if request.cookies['name'] && request.cookies['zipcode']
    redirect '/newsfeed'
   else
    redirect "/newsfeed?firstname=" + URI.encode(@nocookiefirstname) + "&zipcode=" + URI.encode(@nocookiezipcode)
  end
  end

  get '/livemaps' do
    puts "url is now " + request.url

    uri = URI.parse(request.url.to_s)
    uri.query
    paramHash = Hash[URI.decode_www_form(uri.query)] # => {"id"=>"john"}
    @allStops = paramHash['stopscodes']
    @allStopsNamed = paramHash['stopsnames']
    @allLegs = paramHash['legs']
    @allWeathers = paramHash['weathers']
    @allWeatherEmojis = paramHash['weatheremojis']
    @allWeatherEmojis = @allWeatherEmojis.gsub("clear-day", "☀️").gsub("clear-night", "🌑").gsub("partly-cloudy-day", "⛅").gsub("partly-cloudy-night", "🌑").gsub("rain", "🌧️").gsub("snow", "❄️").gsub("sleet", "🌨️").gsub("wind", "🍃").gsub("fog", "🌫️").gsub("cloudy", "☁️")

    @stopsArray = @allStops.split("|")

    @stopsNamedArray = @allStopsNamed.split("|")

    @legsArray = @allLegs.split("|")

    @weatherArray = @allWeathers.split("|")

    @weatherEmojiArray = @allWeatherEmojis.split("|")


    @liveMapsUrl = "https://www.google.com/maps/embed/v1/directions?key=AIzaSyB5TI9veyX0wrhZ9VeaEhR3DNSC8FGDiSY&origin=" + @stopsArray[0] + "&destination=" + @stopsArray[-1]
    @wayPointsArrayLength = @stopsArray.length - 1

    for i in 1..@stopsArray.length-2 do

      if i == 1
        @liveMapsUrl = @liveMapsUrl + "&waypoints="

      end
      @liveMapsUrl = @liveMapsUrl + @stopsArray[i]
      if i != @stopsArray.length-2
        @liveMapsUrl = @liveMapsUrl + "|"
      end
    end

    @liveMapsUrl = @liveMapsUrl.gsub("%26", "&").gsub("%3D", "=").gsub("%3A", ":").gsub("%2F", "/").gsub("%3F", "?").gsub(" ", "%20")

    @liveMapsUrl = @liveMapsUrl + "&mode=driving" # and URL is ready for use by :livemaps

    response.set_cookie 'mapsurl',
      {:value=> @liveMapsUrl, :max_age => "31556926"}


    # now create stops description

    @liveMapsStopsDescription = ""

    for i in 0..@stopsNamedArray.length-1 do

      stopNumber = i + 1
      @liveMapsStopsDescription = @liveMapsStopsDescription + stopNumber.to_s + ". " + @stopsNamedArray[i] + " (" + @weatherEmojiArray[i] + " " + @weatherArray[i] + "ºF)<br>"
      if i != @stopsArray.length - 1
        @liveMapsStopsDescription = @liveMapsStopsDescription + "Drive " + @legsArray[i] + "<br>"

      end
    end

    erb :livemaps
  end

  get '/news' do
    redirect '/newsfeed'
  end

  get '/newsfeed' do
    begin
    puts "Got /newsfeed"
    @savename = ""
    @savezip = ""
    if request.cookies['name'] && request.cookies['zipcode'] && request.cookies['zipcode'] != "reset"
      @zip_code = request.cookies['name']
      @first_name = request.cookies['zipcode']
      # turn session data into cookies
      puts "found the cookies"
      response.set_cookie 'name',
      {:value=> request.cookies['name'], :max_age => "31556926"}
      response.set_cookie 'zipcode',
      {:value=> request.cookies['zipcode'], :max_age => "31556926"}
      @savename = request.cookies['name']
      @savezip = request.cookies['zipcode']
    else
      # no cookies (yet?)
      uri = URI.parse(request.url.to_s)
      uri.query
      paramHash = Hash[URI.decode_www_form(uri.query)] # => {"id"=>"john"}
      @nocookiefirstname = paramHash['firstname']
      @nocookiezipcode = paramHash['zipcode']
      puts "first name is " + @nocookiefirstname + " and zip code is " + @nocookiezipcode
      if @nocookiefirstname && @nocookiezipcode
      @savezip = @nocookiezipcode
      @savename = @nocookiefirstname
      else
      redirect '/'
      end
     end
    @first_name = @savename
    @zip_code = @savezip.gsub(" ", "+")
    puts "here is saved name and saved zip:"
    puts @savename
    puts @savezip
    @savename = savename(@first_name)
    @nameofuser = @first_name
    @cityofuser = zipcodetocity(@zip_code)
    @welcomearray = ["Welcome", "Hello", "Nice to see you", "Welcome back", "Hey", "Great to see you again", "Glad you're back", "Happy to see you again", "Welcome", "Hello"]
    saveisfirstrun()
    @welcome = @welcomearray.sample
    @long = zipcodetolong(@zip_code)
    @lat = zipcodetolat(@zip_code)
    title1 = "title1"
    article1 = "article1"
    link1 = "link1"
    title2 = "title2"
    article2 = "article2"
    link2 = "link2"
    title3 = "title3"
    article3 = "article3"
    link3 = "link3"
    title4 = "title4"
    article4 = "article4"
    link4 = "link4"
    title5 = "title5"
    article5 = "article5"
    link5 = "link5"
    nytorig
    @nytimestitle1 = nyt("title1")
     @nytimesarticle1 = nyt(article1)
     @nytimeslink1 = nyt(link1)
     @nytimestitle2 = nyt(title2)
     @nytimesarticle2 = nyt(article2)
    @nytimeslink2 = nyt(link2)
     @nytimestitle3 = nyt(title3)
    @nytimesarticle3 = nyt(article3)
    @nytimeslink3 = nyt(link3)
    @nytimestitle4 = nyt(title4)
    @nytimesarticle4 = nyt(article4)
    @nytimeslink4 = nyt(link4)
    @nytimestitle5 = nyt(title5)
    @nytimesarticle5 = nyt(article5)
    @nytimeslink5 = nyt(link5)
    # @updatetimes = Time.new
    @lnglat = "lat=#{@lat}&lng=#{@long}"
    @updatetime = findtime(@lnglat)
    # @updatetime = @updatetimes.getlocal.strftime("%H:%M")
    foxsportsorig
    @foxsportsname1 = foxsports("name1")
    @foxsportsdescription1 = foxsports("description1")
    @foxsportsurl1 = foxsports("url1")
    @foxsportsname2 = foxsports("name2")
    @foxsportsdescription2 = foxsports("description2")
    @foxsportsurl2 = foxsports("url2")
    @foxsportsname3 = foxsports("name3")
    @foxsportsdescription3 = foxsports("description3")
    @foxsportsurl3 = foxsports("url3")
    @foxsportsname4 = foxsports("name4")
    @foxsportsdescription4 = foxsports("description4")
    @foxsportsurl4 = foxsports("url4")
    @foxsportsname5 = foxsports("name5")
    @foxsportsdescription5 = foxsports("description5")
    @foxsportsurl5 = foxsports("url5")
    guardianorig
    @guardianname1 = guardian("name1")
    @guardiandescription1 = guardian("description1")
    @guardianurl1 = guardian("url1")
    @guardianname2 = guardian("name2")
    @guardiandescription2 = guardian("description2")
    @guardianurl2 = guardian("url2")
    @guardianname3 = guardian("name3")
    @guardiandescription3 = guardian("description3")
    @guardianurl3 = guardian("url3")
    @guardianname4 = guardian("name4")
    @guardiandescription4 = guardian("description4")
    @guardianurl4 = guardian("url4")
    @guardianname5 = guardian("name5")
    @guardiandescription5 = guardian("description5")
    @guardianurl5 = guardian("url5")
    abcorig
    @abcname1 = abc("name1")
    @abcdescription1 = abc("description1")
    @abcurl1 = abc("url1")
    @abcname2 = abc("name2")
    @abcdescription2 = abc("description2")
    @abcurl2 = abc("url2")
    @abcname3 = abc("name3")
    @abcdescription3 = abc("description3")
    @abcurl3 = abc("url3")
    @abcname4 = abc("name4")
    @abcdescription4 = abc("description4")
    @abcurl4 = abc("url4")
    @abcname5 = abc("name5")
    @abcdescription5 = abc("description5")
    @abcurl5 = abc("url5")
    engadgetorig
    @engadgetname1 = engadget("name1")
    @engadgetdescription1 = engadget("description1")
    @engadgeturl1 = engadget("url1")
    @engadgetname2 = engadget("name2")
    @engadgetdescription2 = engadget("description2")
    @engadgeturl2 = engadget("url2")
    @engadgetname3 = engadget("name3")
    @engadgetdescription3 = engadget("description3")
    @engadgeturl3 = engadget("url3")
    @engadgetname4 = engadget("name4")
    @engadgetdescription4 = engadget("description4")
    @engadgeturl4 = engadget("url4")
    @engadgetname5 = engadget("name5")
    @engadgetdescription5 = engadget("description5")
    @engadgeturl5 = engadget("url5")
    erb :weathernews
    rescue
      session[:fail] = "You need to enter your location again. Make sure it's in a valid format, like \"10021\" or \"New York, NY\"."
      redirect '/retry'
    end
end
end
