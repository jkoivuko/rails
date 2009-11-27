class EgStartDateTypechange < ActiveRecord::Migration
  def self.up
      # lets try to fix our mistakes. duuuuuuuuuh!
      execute "ALTER TABLE exercisegroups ALTER COLUMN start_date TYPE timestamp with time zone USING timestamp with time zone 'epoch'"
      change_column(:instances, :start_date, :date)
  end

  def self.down
  end
end
