class AddAttachmentChartImgToRampPages < ActiveRecord::Migration
  def self.up
    change_table :ramp do |t|
      t.attachment :chart_img
    end
  end

  def self.down
    remove_attachment :ramp, :chart_img
  end
end
