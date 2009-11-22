class CreateExercisegroups < ActiveRecord::Migration
  def self.up
    create_table :exercisegroups do |t|
        t.column :room, :string
        t.column :name, :string
        t.column :date, :date
      t.timestamps
    end
  end

  def self.down
    drop_table :exercisegroups
  end
end
