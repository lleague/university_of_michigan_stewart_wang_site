class AddAttachmentImageToNewsArticles < ActiveRecord::Migration
  def self.up
    change_table :news_articles do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :news_articles, :image
  end
end
