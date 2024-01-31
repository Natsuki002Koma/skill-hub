class TweetsController < ApplicationController
  def index
    @skill = Skill.find(params[:skill_id])
    @user = @skill.user
    @tweet = Tweet.new
    @tweets = @skill.tweets.includes(:user)
  end

  def create
    @skill = Skill.find(params[:skill_id])
    @user = @skill.user
    @tweet = @skill.tweets.new(tweet_params)
    if @tweet.save
      redirect_to skill_tweets_path(@skill)
    else
      @tweets = @skill.tweets.includes(:user)
      render :index, status: :unprocessable_entity
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @skill = @tweet.skill
    @tweet.destroy if current_user == @tweet.user
    redirect_to skill_tweets_path(@skill)
  end

  private

  def tweet_params
    params.require(:tweet).permit(:text, :image).merge(user_id: current_user.id)
  end
end
