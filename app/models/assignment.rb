class Assignment < ApplicationRecord
  has_many :users, through: :collaboration
  belongs_to :collaboration
  belongs_to :task
end
