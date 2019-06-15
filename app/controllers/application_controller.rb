class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :reminders

  def reminders
    Rails.logger.warn('checking the ReminderLog to see if we should do the thing')
    if ReminderLog.done_for_today
      Rails.logger.warn('   we did it already, stopping.')
    else
      Plant.update_all('"waterCurrent" = "waterCurrent" - ("waterNeed" / 7.0)')
      Plant.update_all('"love" = love-1')
      Rails.logger.warn('   finding all the all the water_current values that are less than 1/6 of the water_need values')
      Rails.logger.warn('   sending an e-mail reminder to the owners of the dry plants we just found')
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:nickName, :email, :password, :password_confirmation)
    end

    devise_parameter_sanitizer.permit(:account_update) do |user_params|
      user_params.permit(:nickName, :email, :photo)
    end
  end

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end
