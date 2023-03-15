class Guest < ApplicationRecord
  belongs_to :event

  enum :invitation_status, %i[invite_not_sent invited accepted declined], default: :invite_not_sent
end
