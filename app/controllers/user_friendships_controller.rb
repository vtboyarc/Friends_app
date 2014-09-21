class UserFriendshipsController < ApplicationController
  before_filter :authenticate_user!, only: [:new]
  
  def index
    @user_friendships = current_user.user_friendships.all
  end
  
  def new
    if params[:friend_id]
      @friend = User.where(profile_name: params[:friend_id]).first
      raise ActiveRecord::RecordNotFound if @friend.nil?
      @user_friendship = current_user.user_friendships.new friend: @friend
    else
      flash[:error] = "Friend Required"
    end
  rescue ActiveRecord::RecordNotFound
    render file: 'public/404', status: :not_found
  end

  def create
    if params[:user_friendship] && params[:user_friendship].has_key?(:friend_id)
      @friend = User.where(profile_name: params[:user_friendship][:friend_id]).first
      @user_friendship = current_user.user_friendships.new friend: @friend
      @user_friendship.save
      flash[:notice] = "New friend, #{@friend.full_name}, added!"
      redirect_to profile_path(@friend)
    else
      flash[:error] = "Friend Required"
      redirect_to root_path
    end
  end
end

