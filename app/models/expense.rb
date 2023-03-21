class Expense < ApplicationRecord
  belongs_to :event
  enum :status, [:paid, :unpaid]
  acts_as_taggable_on :categories
end
