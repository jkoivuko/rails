class Many2many < ActiveRecord::Migration
  def self.up
    
    #add_column :exercisegroups, :user_id, :integer
    
      # generate the join table
      create_table "registrations" do |t|
        t.integer "exercisegroup_id", "user_id"
      end
      add_index "registrations", "exercisegroup_id"
      add_index "registrations", "user_id"
      
  end

  def self.down
    #remove_column :exercisegroups, :user_id
    
    drop_table "registrations"
  end
end
