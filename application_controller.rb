require 'bundler'
Bundler.require
require_relative 'models/model.rb'

class MyApp < Sinatra::Base
  use Rack::Session::Cookie, :key => 'rack.session',
                           :path => '/',
                           :secret => 'seeeeeecret'



  get '/' do
    if request.cookies['name'] && request.cookies['zipcode'] != "reset"
      redirect "/news?first_name=" + URI.encode(request.cookies['name']) + "&zip_code=" + URI.encode(request.cookies['zipcode'])
    end
    erb :index
  end


  get '/bookmark' do
    @bookmark = true
    redirect "/"

  end

  get '/retry' do
    if session[:fail]
      @reason = session[:fail]
    end
    erb :retry
  end

  get '/setup' do
    response.set_cookie 'zipcode',
      {:value=> "reset", :max_age => "31556926"}
    redirect "/"
  end

  get '/news' do
    puts "Got /news"
    if request.cookies['name'] && request.cookies['zipcode'] && request.cookies['zipcode'] != "reset"
      # do nothing
      puts "already have cookies"
    else
      puts "setting zipcode and name to:"
      puts params[:zip_code]
      puts params[:first_name]
      savezip(params[:zip_code])
      savename(params[:first_name])
     end
    @savename = request.cookies['name']
    @savezip = request.cookies['zipcode']
    puts "here is saved name and saved zip:"
    puts @savename
    puts @savezip
    if @savezip != nil && @savezip != "" && @savename != nil && @savename != ""
      puts "a is true."
    if @savezip.length == 5 && @savezip.to_i
      puts "b is true."
    if @@zipshash[@savezip] != nil
      puts "c is true."
    @savename = savename(params[:first_name])
    @nameofuser = params[:first_name]
    @zipcodeofuser = params[:zip_code]
    @cityofuser = zipcodetocity(params[:zip_code])
    @welcomearray = ["Welcome", "Hello", "Nice to see you", "Welcome back", "Hey", "Great to see you again", "Glad you're back", "Happy to see you again", "Welcome", "Hello"]
    @welcome = @welcomearray.sample
    @long = zipcodetolong(params[:zip_code])
    @lat = zipcodetolat(params[:zip_code])
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
  else
    session[:fail] = "Our zip code database did not recognize your inputted zip code. If you inputted a valid US zip code, please contact us to report the issue."
    redirect "/retry"
  end
  else
    session[:fail] = "The zip code you entered is not valid."
    redirect "/retry"
  end
else
  session[:fail] = "One of the fields did not contain any text."
  redirect "/retry"

end
end
end
