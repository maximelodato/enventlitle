class ApplicationController < ActionController::Base
    helper_method :current_user, :user_signed_in?
  
    private
  
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound
      session[:user_id] = nil
    end
  
    def user_signed_in?
      session[:user_id].present?
    end
  
    def authenticate_user
      redirect_to login_path, alert: 'Vous devez être connecté pour accéder à cette page.' unless current_user
    end
  end
  