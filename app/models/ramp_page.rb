class RampPage < ApplicationRecord

  self.table_name = "ramp"

  has_attached_file :scan_img, styles: { medium: "280x190>" }
  validates_attachment_content_type :scan_img, content_type: /\Aimage\/.*\z/

  has_attached_file :chart_img, styles: { large: "1151x613>" }
  validates_attachment_content_type :chart_img, content_type: /\Aimage\/.*\z/

  scope :sorted, lambda { order("name ASC") }
  scope :newest_first, lambda { order("created_at DESC") }

end
