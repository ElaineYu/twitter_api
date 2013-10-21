class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.text :tweet
      t.integer :twitter_user_id
      t.datetime :tweeted_at

    end
  end
end
