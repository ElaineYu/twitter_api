class TwitterUser < ActiveRecord::Base
  # Remember to create a migration!
  has_many :tweets

  def fetch_tweets!
    @tweets = Tweet.where(twitter_user_id: self.id)
    @tweets.destroy_all
    Twitter.user_timeline(self.username).each do |tweet|
      Tweet.create(tweet: tweet.text, twitter_user_id: self.id, tweeted_at: tweet.created_at)
    end
  end

  def tweets_stale?

      time_lapse = (Time.now - self.tweets.first.tweeted_at) / (3600 * 24) 
      
      time_lapse > 7

     

  end


end
