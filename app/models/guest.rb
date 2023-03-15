class Guest < ApplicationRecord
  belongs_to :event

  enum :invite_status, [ :not_invited, :invited, :attending, :not_attending ]
end
