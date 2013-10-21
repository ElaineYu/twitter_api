#================ Get ==================
get '/' do

  # Twitter.update("HELLO WORLD!")
  erb :index
end

get '/:username' do
  @user = TwitterUser.find_or_create_by(username: params[:username])

  
    if @user.tweets.empty? || @user.tweets_stale?
      
      @user.fetch_tweets!

    end

  @tweets = @user.tweets.limit(10)

  erb :see_tweets
end
  # @user = params[:username]
  # erb :see_tweets


#================= Post ================
# post '/....' do
#   @user = params[:username] ? #send name to ...

#   if request.xhr?
#     erb: see_tweets, :layout => false
#   else
#     erb: index
# end



