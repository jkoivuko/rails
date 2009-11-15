class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.column :login, :string
      t.column :hashed_password, :string
      t.column :realname, :string
      t.column :studentnum, :string

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
