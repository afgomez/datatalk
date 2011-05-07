class CreateAnalyses < ActiveRecord::Migration

  def self.up
    create_table :analyses do |t|
      t.string :title
      t.string :excerpt
      t.text :body
      t.belongs_to :analysis
      t.belongs_to :user

      t.timestamps
    end
  end

  def self.down
    drop_table :analyses
  end
  
end
