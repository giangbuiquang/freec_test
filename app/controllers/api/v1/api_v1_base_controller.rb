class Api::V1::ApiV1BaseController < ApplicationController
  # include Pundit
  # before_action :authenticate_user!
  # before_action :check_user
  # before_action :check_permission
  # rescue_from Pundit::NotAuthorizedError, with: :_user_not_authorized
	# ############ before_action protect_from_forgery :exception

  # def check_permission
  #   authorize(self.class.name.gsub("Controller", "").split("::").map{|e| e.underscore.to_sym})
  # end

  
  # private
  # def _user_not_authorized
  #   render json: { errors: ["You are not allow to make this request"]}, status: :forbidden
  # end


end
