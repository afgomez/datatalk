class CreateDatasets < ActiveRecord::Migration

  def self.up
    create_table :datasets do |t|
      t.string :name
      t.string :origin
      t.text :description
      t.string :data_file, :null => false
      t.belongs_to :user
      
      t.timestamps
    end
  end

  def self.down
    drop_table :datasets
  end
  
end
