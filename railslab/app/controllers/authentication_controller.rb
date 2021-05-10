class AuthenticationController < ApplicationController
    #skip_before_action :authenticate_request
    def initialize()
        payload = { data: 'test' }

        # IMPORTANT: set nil as password parameter
        @token = JWT.encode payload, nil, 'none'

        puts @token

        @decoded_token = JWT.decode @token, nil, false

        puts @decoded_token
    end 

    def authenticate
        render  json: {token: @token }

        
    end

end
