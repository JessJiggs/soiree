class Collaboration < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many :assignments, dependent: :destroy
  enum :role, [:owner]

end
