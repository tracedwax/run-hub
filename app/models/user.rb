class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me

  validates_uniqueness_of :username

  def self.email_exists? email
    return (not User.find_by_email(email).nil?)
  end


  private

  def self.register_with_facebook_data(fbuid, fbtoken)
    graph = Koala::Facebook::GraphAPI.new(fbtoken)
    profile = graph.get_object("me")

    self.create(
      uid:        fbuid,
      token:      fbtoken,
      username:   profile['first_name']#,
      #last_name:  profile['last_name'],
      #name:       profile['name'],
      #gender:     profile['gender'],
      #email:      profile['email']
    )
  end
end
