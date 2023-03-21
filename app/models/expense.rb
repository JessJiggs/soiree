class Expense < ApplicationRecord
  belongs_to :event
  enum :status, [:paid, :unpaid]
  acts_as_taggable_on :categories
  include PgSearch::Model
  pg_search_scope :search_by_name_and_amount_spent_and_status,
    against: %i[name amount_spent status],
    using: {
      tsearch: { prefix: true }
    }
end
