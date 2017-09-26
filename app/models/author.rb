class Author < ApplicationRecord

  self.table_name = "authors"

  has_and_belongs_to_many :publications
  scope :sorted, lambda { order(:name) }

end
