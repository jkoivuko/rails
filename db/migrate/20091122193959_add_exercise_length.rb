class AddExerciseLength < ActiveRecord::Migration
  def self.up
     add_column :exercisegroups, :start_date, :date
     add_column :exercisegroups, :length, :string
  end

  def self.down
    remove_column :exercisegroups, :length, :start_date
  end
end
