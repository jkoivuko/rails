class Admin::RolesController < ApplicationController
  layout "admin"
  active_scaffold :roles
  
  before_filter :login_required
  before_filter :admin_required
  
end
