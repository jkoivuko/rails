class AddForeignKeyToCourses < ActiveRecord::Migration
  def self.up
     add_column :courses, :course_category_id, :integer
  end

  def self.down
    remove_column :courses, :course_category_id
          
  end
end
