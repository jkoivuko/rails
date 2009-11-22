class Instance < ActiveRecord::Migration
  def self.up
  
    add_column :instances, :course_id, :integer
  end

  def self.down
    remove_column :instances, :course_id
  end
end
