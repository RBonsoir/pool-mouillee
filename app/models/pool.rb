class Pool < ActiveRecord::Base
  # belongs_to :owner, class_name: 'User', foreign_key: :owner_id
  belongs_to :user, dependent: :destroy
  has_many :bookings

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  validates :title, presence: true
  validates :address, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :capacity, numericality: { only_integer: true } # "nil" is not accepted as not an integer!
  validates :user, presence: true

  has_attached_file :picture,
    styles: {
      large: "1400x933>",
      medium: "350x233>",
      thumbnail: "70x40>"},
      default_url: "default_:style.jpg"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

end
