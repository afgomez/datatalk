class CreateAnalysesDatasets < ActiveRecord::Migration

  def self.up
    create_table :analyses_datasets, :id => false do |t|
      t.belongs_to :dataset
      t.belongs_to :analysis
    end
  end

  def self.down
    drop_table :analyses_datasets
  end
  
end
