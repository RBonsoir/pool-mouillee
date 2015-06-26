class Booking < ActiveRecord::Base
  # belongs_to :guest, class_name: 'User', foreign_key: :guest_id
  belongs_to :user, dependent: :destroy
  belongs_to :pool, dependent: :destroy

  validates :user, presence: true
  validates :pool, presence: true
  validates :status, inclusion: {in: %w(Pending Confirmed Refused), allow_nil: false}
  validates :checkin_on, presence: true
  validates :length,  inclusion: {in: ['Morning', 'Afternoon', 'All Day', 'All Night Long'], allow_nil: false}

end
