class Guest < ApplicationRecord
  belongs_to :event

  enum :invitation_status, %i[invite_not_sent invited accepted declined], default: :invite_not_sent

  include PgSearch::Model
  pg_search_scope :search_by_first_name_and_last_name_and_email_address_and_phone_number_and_invitation_status,
    against: %i[first_name last_name email_address phone_number invitation_status],
    using: {
      tsearch: { prefix: true }
    }
end
