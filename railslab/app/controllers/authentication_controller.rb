class AuthenticationController < ApplicationController
 

    # LOGGING IN
    def login
      
      @user = User.find_for_authentication(email: params[:email])

      if @user.valid_password?(params[:password])
        token = encode_token({user_id: @user.id})
        render json: {user: @user, token: token}
      else
        render json: {error: "Invalid username or password"}
      end
    end


end


