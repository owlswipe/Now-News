require 'bundler'
Bundler.require
require_relative 'models/model.rb'

class MyApp < Sinatra::Base
  use Rack::Session::Cookie, :key => 'rack.session',
                           :path => '/',
                           :secret => 'seeeeeecret'



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
