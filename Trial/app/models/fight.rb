class Fight < ActiveRecord::Base
  belongs_to :pet
  belongs_to :petowner
  attr_accessible :monster_id, :petowner_id
end
