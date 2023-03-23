class Collaboration < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many :assignments, dependent: :destroy
  has_many :tasks, through: :assignments
  enum :role, [:owner]
end
