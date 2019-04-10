class PagesController < ApplicationController
  before_action :set_user

  def home
    if @user
      redirect_to dashboard_path, notice: 'Welcome to your dashboard'
    end
  end

  def dashboard
    @plants = @user.plants
  end

  private
  def set_user
    @user = current_user
  end
end
