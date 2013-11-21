class Booking < ActiveRecord::Base
  belongs_to :session

  validates :name, presence: true
  validates :email, presence: true
  validates :project, presence: true, length: { in: 140..280 }
end
