module Overrides
  class SessionsController < DeviseTokenAuth::SessionsController
    # Prevent session parameter from being passed
    # Unpermitted parameter: session
    wrap_parameters format: []
  end
end
