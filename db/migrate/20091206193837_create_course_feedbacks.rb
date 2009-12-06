class CreateCourseFeedbacks < ActiveRecord::Migration
  def self.up
    create_table :course_feedbacks do |t|
      t.integer :instance_id
      t.string :message

      t.timestamps
    end
  end

  def self.down
    drop_table :course_feedbacks
  end
end
