class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_attached_file :picture,
    styles: { normal: "200x200#" },
    default_url: "default-avatar.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [ :facebook ]

  has_many :bookings
  has_many :pools
  has_many :requests, through: :pools, source: :bookings

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :encrypted_password, presence: true

  def self.find_for_facebook_oauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.facebook_picture = auth.info.image
      user.token = auth.credentials.token
      user.token_expiry = Time.at(auth.credentials.expires_at)
    end
  end

  def profile_picture
    if self.picture.exists?
      self.picture.url(:normal)
    end
    if ! self.picture.url().include? "default"
      pic = self.picture.url(:normal)
    elsif self.provider
      pic = self.facebook_picture
    else
      pic = self.picture.url(:normal)
    end
    return pic
  end

end
