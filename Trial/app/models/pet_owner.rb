class PetOwner < ActiveRecord::Base
  attr_accessible :adopted_on, :pet_id, :pet_name, :user_id
end
