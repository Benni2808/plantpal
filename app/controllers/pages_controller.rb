class PagesController < ApplicationController
  def home
    if current_user
      redirect_to plants_path, notice: 'Welcome to your dashboard'
    end
  end
end
