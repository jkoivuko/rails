class CreateAdmins < ActiveRecord::Migration
  def self.up
    create_table "admins" do |t|
      t.string :name
    end
    
    # generate the join table
    create_table "admins_users", :id => false do |t|
      t.integer "admin_id", "user_id"
    end
    add_index "admins_users", "admin_id"
    add_index "admins_users", "user_id"
  end

  def self.down
    drop_table "admins"
    drop_table "admins_users"
  end
end