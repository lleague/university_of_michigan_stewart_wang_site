class TeamMember < ApplicationRecord

  self.table_name = "team_members"

  has_attached_file :image, :styles => {medium: "250x250#"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  scope :sorted, lambda { order("last_name ASC") }
end
