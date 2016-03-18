class StartController < ApplicationController

   def home
      code = auto_logout
      if(code == true)
         sign_out
         redirect_to root_path
      else
         #Check if Maintenance is turned_on
         maintenancemode = Maintenancemode.find_by_id(1)
         if(maintenancemode.maintenance_on)
            #Determine if we are a regular user
            regularUser = (!current_user || !current_user.admin?)
            if(regularUser)
               redirect_to maintenance_path
            end
         end
      end
   end

   def about
   end

   def update
   end

   def contact
   end
end
