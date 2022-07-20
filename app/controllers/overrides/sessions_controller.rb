module Overrides
  class SessionsController < DeviseTokenAuth::SessionsController

    # override this method to customise how the resource is rendered. in this case an ActiveModelSerializers 0.10 serializer.
    def render_create_success
      super
    end
  end
end