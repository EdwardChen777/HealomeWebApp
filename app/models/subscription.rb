class Subscription < ApplicationRecord
  belongs_to :user

  scope :is_subscribed, -> {where(status: "active")}
  scope :chronological, -> { order(start_date: :desc ) }
end
