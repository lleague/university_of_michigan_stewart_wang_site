class ChangeDatatypeOfMonthPublishedToString < ActiveRecord::Migration[5.0]
  def up
    change_column("publications", "month_published", :string, :limit => 20)
  end
  def down
    change_column("publications", "month_published", :int)
  end
end
