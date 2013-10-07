module SessionsHelper
   def sign_in(user)
      cookies.permanent[:remember_token] = user.remember_token
      self.current_user = user
   end

   def current_user=(user) #sets the current_user to the user's value
      @current_user = user
   end

   def current_user #Sets the current_user if it is nil
      @current_user ||=User.find_by_remember_token(cookies[:remember_token])
   end

   def signed_in?
      !current_user.nil?
   end

   def sign_out
      self.current_user = nil
      cookies.delete(:remember_token)
   end
end
