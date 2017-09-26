class CreateNewsArticles < ActiveRecord::Migration[5.0]
  def up
    create_table :news_articles do |t|
      t.string "title", :limit =>1000
      t.string "image", :limit =>2000
      t.string "content", :limit =>10000
      t.timestamps
    end
  end
  def down
    drop_table :news_articles
  end
end
