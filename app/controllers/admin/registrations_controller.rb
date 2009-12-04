class Admin::RegistrationsController < ApplicationController
  layout "admin"
  active_scaffold :registration
  
  before_filter :login_required
  before_filter :admin_required
  
  #active_scaffold :exercisegroup do |config|
  #   config.columns = [:name, :room, :users, :instance, :date, :start_date, :end_date]
  #end
  
  
end
