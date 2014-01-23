class TweetsController < ApplicationController
  def new
    @tweet = current_user.tweets.new
  end

  def create
    current_user.tweets.create(params.require(:tweet).permit(:content))
    flash[:notice] = "Tweet added"
    redirect_to new_tweet_path
  end

  def index
    @tweets = current_user.tweets
  end
end
