class Api::V1::ApiV1BaseController < ApplicationController
  include Pundit::Authorization
  before_action :authenticate_user!
  before_action :_check_permission
  rescue_from Pundit::NotAuthorizedError, with: :_user_not_authorized
  
  private
  def _user_not_authorized
    render json: { errors: ["You are not allow to make this request"]}, status: :forbidden
  end

  def _check_permission
    authorize(self.class.name.gsub("Controller", "").split("::").map{|e| e.underscore.to_sym})
  end

end
