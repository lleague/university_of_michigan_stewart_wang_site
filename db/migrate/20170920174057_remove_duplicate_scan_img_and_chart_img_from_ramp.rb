class RemoveDuplicateScanImgAndChartImgFromRamp < ActiveRecord::Migration[5.0]
  def change
    remove_column :ramp, :chart_img, :string    
  end
end
