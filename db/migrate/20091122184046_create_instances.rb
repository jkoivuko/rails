class CreateInstances < ActiveRecord::Migration
  def self.up
    create_table :instances do |t|
        t.column :description, :string
        t.column :name, :string
        t.column :start_date, :date
        t.column :end_date, :date
      t.timestamps
    end
  end

  def self.down
    drop_table :instances
  end
end
