module Overrides
  class SessionsController < DeviseTokenAuth::SessionsController
    include ActionController::Cookies


    # override this method to customise how the resource is rendered. in this case an ActiveModelSerializers 0.10 serializer.
    def render_create_success
      # @token = @resource.create_token
      # cookies["access_token"] = { :value => @token, :expires => 3600 , :httponly => true }
      # cookies["access_a"] = { :value => 123231, :expires => 3600 }
      super
    end
  end
end