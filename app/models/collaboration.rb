class Collaboration < ApplicationRecord
  belongs_to :user
  has_many :assignments, dependent: :destroy
  enum :role, [:owner]
end
