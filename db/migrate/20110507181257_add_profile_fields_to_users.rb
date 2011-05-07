class AddProfileFieldsToUsers < ActiveRecord::Migration

  def self.up
    add_column ::User.table_name, :member_until, :datetime
    add_column ::User.table_name, :membership_level, :string
  end

  def self.down
    remove_column ::User.table_name, :member_until
    remove_column ::User.table_name, :membership_level
  end

end
