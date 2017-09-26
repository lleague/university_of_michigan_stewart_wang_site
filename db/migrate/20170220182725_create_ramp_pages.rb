class CreateRampPages < ActiveRecord::Migration[5.0]
  def up
    create_table :ramp_pages do |t|

      t.string "name", :limit => 100
      t.string "definition", :limit => 500
      t.string "chart_img", :limit => 2000
      t.string "scan_img", :limit => 2000
      t.json "m_ages"
      t.json "m_valsArr2d"
      t.json "f_ages"
      t.json "f_valsArr2d"
      t.string "vertebrae_number", :limit => 3
      t.timestamps
    end
  end
  def down
    drop_table :ramp_pages
end
