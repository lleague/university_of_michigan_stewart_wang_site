class NewsArticle < ApplicationRecord

  self.table_name = "news_articles"

  has_attached_file :image, :styles => {:medium => "250x"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  scope :sorted, lambda { order("created_at ASC") }

end
