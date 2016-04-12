class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # before_action :respond_to_json
  #
  # def respond_to_json
  #   respond_to :json
  # end
end
