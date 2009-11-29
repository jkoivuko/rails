class Admin::UsersController < ApplicationController
  layout "admin"
  active_scaffold :users
  
  before_filter :login_required
  before_filter :admin_required
  
end
