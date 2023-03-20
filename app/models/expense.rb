class Expense < ApplicationRecord
  belongs_to :event
  enum :status, [:paid, :unpaid], default: :unpaid
  # im not sure if it matters but shouldnt unpaid be firstt - then when you use enum - the default is 0 ? 
  acts_as_taggable_on :categories
end
