class DropAnalysesDataset < ActiveRecord::Migration

  def self.up
    drop_table :analyses_datasets
  end

  def self.down
    create_table :analyses_datasets, :id => false do |t|
      t.belongs_to :dataset
      t.belongs_to :analysis
    end
  end
  
end
