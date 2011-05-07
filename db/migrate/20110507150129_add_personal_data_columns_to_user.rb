class AddPersonalDataColumnsToUser < ActiveRecord::Migration

  def self.up
    add_column :users, :name, :string
    add_column :users, :surname_1, :string
    add_column :users, :surname_2, :string
    add_column :users, :nick, :string
  end

  def self.down
    remove_column :users, :name, :surname_1, :surname_2, :nick
  end
  
end
