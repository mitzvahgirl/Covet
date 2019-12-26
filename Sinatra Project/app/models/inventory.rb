class Inventory < ActiveRecord::Base
    belongs_to :category
    belongs_to :user
end


#user_id
#category_id
