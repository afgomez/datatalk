class AddForeignKeysToVisualizations < ActiveRecord::Migration

  def self.up
    add_column :visualizations, :dataset_id, :integer
    add_column :visualizations, :analysis_id, :integer
  end

  def self.down
    remove_column :visualizations, :dataset
    remove_column :visualizations, :analysis
  end
  
end
