class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :provider, :uid, :name, :first_name,
                    :middle_name, :last_name, :gender, :locale, :username, :timezone, :bio, :birthday, :hometown, :location,
                    :fb_link, :currency, :fb_verified
  # attr_accessible :title, :body

  	def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
	  user = User.where(:provider => auth.provider, :uid => auth.uid).first
	  unless user
	    user = User.create(name:auth.extra.raw_info.name,
                            first_name:auth.extra.raw_info.first_name,
                            middle_name:auth.extra.raw_info.middle_name,
                            last_name:auth.extra.raw_info.last_name,
                            gender:auth.extra.raw_info.gender,
                            username:auth.extra.raw_info.username,
                            timezone:auth.extra.raw_info.timezone,
                            bio:auth.extra.raw_info.bio,
                            birthday:auth.extra.raw_info.birthday,
                            hometown:auth.extra.raw_info.hometown,
                            location:auth.extra.raw_info.location,
                            fb_verified:auth.extra.raw_info.verified,
                            fb_link:auth.extra.raw_info.link,
                            currency:auth.extra.raw_info.currency,
					         provider:auth.provider,
					         uid:auth.uid,
					         email:auth.info.email,
					         password:Devise.friendly_token[0,20]
         )
	  end
	  user
	end

	def self.new_with_session(params, session)
	        super.tap do |user|
	          if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
	            user.email = data["email"] if user.email.blank?
	            user.name = data["name"] if user.name.blank?
	          end
	        end
	end
end
