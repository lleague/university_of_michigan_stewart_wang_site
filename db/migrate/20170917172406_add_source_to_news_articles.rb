class AddSourceToNewsArticles < ActiveRecord::Migration[5.0]
  def up
    add_column("news_articles", "source", :string, :limit => 1000)
  end
  def down
    remove_column("news_articles", "source")
  end
end
