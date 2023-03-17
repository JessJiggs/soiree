class Event < ApplicationRecord
  has_one_attached :photo
  has_many :collaborations, dependent: :destroy
  has_many :expenses, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :guests, dependent: :destroy
  geocoded_by :venue_address
  after_validation :geocode, if: :will_save_change_to_venue_address?
end
