class AddTransposeToVisualizations < ActiveRecord::Migration
  def self.up
    add_column :visualizations, :transpose, :boolean, :default => false
  end

  def self.down
    remove_column :visualizations, :transpose
  end
end
