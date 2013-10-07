class SessionsController < ApplicationController

   def new
   end

   def create
      user = User.find_by_vname(params[:session][:vname].downcase)
      if user && user.authenticate(params[:session][:password])
         sign_in user
         redirect_to user
      else
         flash.now[:error] = 'Invalid vname/password combination' #if either parameter is wrong display error
         render 'new'
      end
   end

   def destroy
      sign_out
      redirect_to users_url #root_url
   end
end
