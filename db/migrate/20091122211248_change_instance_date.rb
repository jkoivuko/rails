class ChangeInstanceDate < ActiveRecord::Migration
  def self.up
    #execute "SET TIME ZONE UTC;"
    change_column(:instances, :start_date, :datetime)
    #change_column(:exercisegroups, :length, :datetime)
    execute "ALTER TABLE exercisegroups ALTER COLUMN length TYPE timestamp with time zone USING timestamp with time zone 'epoch'"
    
    rename_column(:exercisegroups, :length, :end_date)
    
  end

  def self.down
    change_column(:instances, :start_date, :date)
    rename_column(:exercisegroups, :end_date, :length)  
    change_column(:exercisegroups, :length, :string)
    
  end
end
