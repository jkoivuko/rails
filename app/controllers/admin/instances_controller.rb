class Admin::InstancesController < ApplicationController
  layout "admin"
  active_scaffold :instance
  
  before_filter :login_required
  before_filter :admin_required
  
  
end
