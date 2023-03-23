class Event < ApplicationRecord
  has_one_attached :photo
  has_many :collaborations, dependent: :destroy
  has_many :users, through: :collaborations
  has_many :expenses, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :guests, dependent: :destroy
  has_many :messages, dependent: :destroy
  validates :name, presence: true
  validates :description, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :venue_name, presence: true
  validates :venue_address, presence: true
  validates :est_guests, presence: true
  validates :total_budget, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_name,
    against: [ :name ],
    using: {
      tsearch: { prefix: true }
    }

end
