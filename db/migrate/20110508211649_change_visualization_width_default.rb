class ChangeVisualizationWidthDefault < ActiveRecord::Migration
  def self.up
    change_column_default(:visualizations, :width, 917)
  end

  def self.down
    change_column_default(:visualizations, :width, 600)
  end
end
