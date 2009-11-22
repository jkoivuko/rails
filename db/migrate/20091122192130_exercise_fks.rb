class ExerciseFks < ActiveRecord::Migration
   def self.up

      add_column :exercisegroups, :instance_id, :integer
    end

    def self.down
      remove_column :exercisegroups, :instance_id
    end
  end
