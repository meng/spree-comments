class AddResolvedAtToComments < ActiveRecord::Migration
  def self.up
    add_column :comments, :resolved_at, :datetime
  end

  def self.down
    remove_column :comments, :resolved_at
  end
end