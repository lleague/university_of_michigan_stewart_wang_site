class Journal < ApplicationRecord

  self.table_name = "journals"

  has_and_belongs_to_many :publications
  scope :sorted, lambda { order(:name) }

end
