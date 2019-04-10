class PagesController < ApplicationController
  before_action :set_user

  def home
    if @user
      redirect_to dashboard_path, notice: 'Welcome to your dashboard'
    end
  end

  def dashboard
    if @user.photo.attached?
      @user_photo = polymorphic_url @user.photo
    else
      @user_photo = '/assets/default_user.jpg'
    end
    @plants = @user.plants
  end

  private
  def set_user
    @user = current_user
  end
end
