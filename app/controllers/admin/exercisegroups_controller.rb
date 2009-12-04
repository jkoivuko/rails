class Admin::ExercisegroupsController < ApplicationController
  layout "admin"
  active_scaffold :exercisegroup
  
  before_filter :login_required
  before_filter :admin_required
  
  active_scaffold :exercisegroup do |config|
     config.columns = [:name, :room, :users, :instance, :date, :start_date, :end_date]
  end
  
  
end
