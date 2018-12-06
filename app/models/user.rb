class User < ApplicationRecord
    has_many :listings, dependent: :destroy
    has_secure_password
    has_many :authentications, dependent: :destroy
    mount_uploader :avatar, AvatarUploader
    validates :email, presence:true
    # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, uniqueness: true, 
                      length: { minimum: 2},
                      format: { with: VALID_EMAIL_REGEX}

    def self.create_with_auth_and_hash(authentication, auth_hash)
        user = self.create!(
          first_name: auth_hash["info"]["first_name"],
          last_name: auth_hash["info"]["last_name"],
          email: auth_hash["info"]["email"],
          password: SecureRandom.hex(10)
        )
        user.authentications << authentication
        return user
    end
     
      # grab google to access google for user data
    def google_token
        x = self.authentications.find_by(provider: 'google_oauth2')
        return x.token unless x.nil?
    end

end
