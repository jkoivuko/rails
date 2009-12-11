class AddMaxUserCounToExerciseGroups < ActiveRecord::Migration
  def self.up
      add_column :exercisegroups, :size, :integer
    end

    def self.down
      remove_column :exercisegroups, :size
  
  end
end
