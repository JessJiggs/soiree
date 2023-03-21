class Event < ApplicationRecord
  has_one_attached :photo
  has_many :collaborations, dependent: :destroy
  has_many :expenses, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :guests, dependent: :destroy

  include PgSearch::Model
  pg_search_scope :search_by_name,
    against: [ :name ],
    using: {
      tsearch: { prefix: true }
    }

end
