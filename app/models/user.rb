# require 'bcrypt'

class User < ApplicationRecord
    # has_secure_password
    has_many :listings
    has_secure_password
end
