class AddDimensionsToVisualizations < ActiveRecord::Migration
  def self.up
    add_column :visualizations, :width, :integer, :default => 600
    add_column :visualizations, :height, :integer, :default => 300
  end

  def self.down
    remove_column :visualizations, :height
    remove_column :visualizations, :width
  end
end
