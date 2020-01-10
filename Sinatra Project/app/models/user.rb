class User < ActiveRecord::Base
    include BCrypt

    has_secure_password
    has_many :inventories

    validates :username, uniqueness: true
    validates :username, presence: true
end
