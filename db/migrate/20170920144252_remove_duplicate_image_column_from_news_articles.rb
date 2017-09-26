class RemoveDuplicateImageColumnFromNewsArticles < ActiveRecord::Migration[5.0]
  def change
    remove_column :news_articles, :image
  end
end
