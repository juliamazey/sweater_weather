class Api::V1::UsersController < ApplicationController

   def create
     user = User.new(user_params)
     user.api_key = get_key
     if user.save
       render json: { "api_key": "#{user.api_key}"}
     end
   end

   private

   def user_params
     params.permit(:email, :password, :password_confirmation)
   end

   def get_key
     SecureRandom.urlsafe_base64
   end

end
