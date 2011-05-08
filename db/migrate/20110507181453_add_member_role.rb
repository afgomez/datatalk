class AddMemberRole < ActiveRecord::Migration
  def self.up
    Role.create!(:id => 3, :title => 'Member')
  end

  def self.down
  end
end
