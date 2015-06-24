class Pool < ActiveRecord::Base
  # belongs_to :owner, class_name: 'User', foreign_key: :owner_id
  belongs_to :user
  has_many :bookings

  validates :title, presence: true
  validates :city, inclusion: {in: %w(Cannes Nice Palavas Valence Avignon Santa-Barbara Miami Monaco Yakutsk), allow_nil: false}
  validates :price, presence: true, numericality: { only_integer: true }
  validates :capacity, numericality: { only_integer: true } # "nil" is not accepted as not an integer!
  validates :address, presence: true
  validates :user, presence: true

  has_attached_file :picture,
    styles: {
      large: "1400x933>",
      medium: "350x233>",
      thumbnail: "70x40>"},
      default_url: "default_:style.jpg"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

end
