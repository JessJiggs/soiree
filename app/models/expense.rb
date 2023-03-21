class Expense < ApplicationRecord
  belongs_to :event
  enum :status, [:unpaid, :paid ], default: :unpaid
  acts_as_taggable_on :categories
end
