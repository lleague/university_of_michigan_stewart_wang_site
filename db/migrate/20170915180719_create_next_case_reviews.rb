class CreateNextCaseReviews < ActiveRecord::Migration[5.0]
  def up
    create_table :next_case_reviews do |t|
      t.string "when", :limit => 500
      t.timestamps
    end
  end

  def down
    drop_table :next_case_reviews
  end
end
