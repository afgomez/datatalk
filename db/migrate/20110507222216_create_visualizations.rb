class CreateVisualizations < ActiveRecord::Migration

  def self.up
    create_table :visualizations do |t|
      t.string :legend
      t.text :body

      t.timestamps
    end
  end

  def self.down
    drop_table :visualizations
  end
  
end
