class Expense < ApplicationRecord
  belongs_to :event
  enum :status, [:unpaid, :paid ]
  acts_as_taggable_on :categories
end
