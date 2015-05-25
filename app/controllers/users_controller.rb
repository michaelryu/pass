class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  skip_before_action :verify_authenticity_token, only: :send

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    if logged_in?
      @user = User.find(params[:id])
    else
      redirect_to root_url
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def texty
    @random = rand.to_s[2..5]
    client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token
    message = client.messages.create from: '+1 (604) 337-1201', to: '+82 10 5517 5456', body: "Password: #{@random}"
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:phone, :password)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

end
