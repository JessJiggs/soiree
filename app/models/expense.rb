class Expense < ApplicationRecord
  belongs_to :event
  enum :status, [:paid, :unpaid]
end
