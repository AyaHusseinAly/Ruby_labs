class AuthenticationController < ApplicationController
 

    # LOGGING IN
    def login
      @user = User.find_by(email: params[:email])
  
      #if @user && @user.authenticate(params[:password])
        token = encode_token({user_id: @user.id})
        render json: {user: @user, token: token}
      #else
      #  render json: {error: "Invalid username or password"}
      #end
    end
  

end

