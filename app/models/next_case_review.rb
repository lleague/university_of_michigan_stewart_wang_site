class NextCaseReview < ApplicationRecord
  scope :sorted, lambda { order("created_at ASC") }
end
