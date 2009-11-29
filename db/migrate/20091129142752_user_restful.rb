class UserRestful < ActiveRecord::Migration
  def self.up
    add_column :users, :email, :string
    add_column :users, :crypted_password, :string
    add_column :users, :salt, :string
    add_column :users, :remember_token, :string
    add_column :users, :remember_token_expires_at, :datetime 
    
    add_index :users, :login, :unique => true
  end

  def self.down
   remove_column :users, :email
   remove_column :users, :crypted_password
   remove_column :users, :salt
   remove_column :users, :remember_token
   remove_column :users, :remember_token_expires_at
   
   remove_index :users, :login
   
  end
end