class ApplicationController < ActionController::API
	include DeviseTokenAuth::Concerns::SetUserByToken
	include Pagy::Backend
  include ActionController::Cookies
end
