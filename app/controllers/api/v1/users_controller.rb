class Api::V1::UsersController < ApplicationController

   def create
     user = User.create_new(user_params)
     if user.save
       render json: { api_key: user.api_key }, status: 201
     else
       render body: 'Bad Request', status: 400
     end
   end

   private

   def user_params
     params.permit(:email, :password, :password_confirmation)
   end

end
