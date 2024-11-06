class Connection < ApplicationRecord
  belongs_to :user
  validates :connected_user, presence: true
  validates :status, presence: true, inclusion: {in: ["pending", "accepted", "rejected"]}
end
