class Collaboration < ApplicationRecord
  belongs_to :user
  enum :role, [ :owner]
end
