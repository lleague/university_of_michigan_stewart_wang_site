class Publication < ApplicationRecord

  self.table_name = "publications"

  has_and_belongs_to_many :authors
  has_and_belongs_to_many :journals
  accepts_nested_attributes_for :authors, :journals

  scope :sorted, lambda { order("year_published DESC") }
  scope :newest_first, lambda { order("created_at DESC") }
  #scope :search, lambda {|query| where(["name LIKE ?", "%#{{query}}"])
#}

end
