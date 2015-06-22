class Pool < ActiveRecord::Base
  # belongs_to :owner, class_name: 'User', foreign_key: :owner_id
  belongs_to :user

  validates :title, presence: true
  validates :city, inclusion: {in: %w(Cannes Nice Palavas Valence Avignon Santa-Barbara Miami Monaco Yakutsk), allow_nil: false}
  validates :price, presence: true, numericality: { only_integer: true }
  validates :capacity, numericality: { only_integer: true } # "nil" is not accepted as not an integer!
  validates :address, presence: true
  validates :user, presence: true

end
