class Admin::UsersController < ApplicationController
  layout "admin"
  active_scaffold :users
  
  before_filter :login_required
  before_filter :admin_required
  
  active_scaffold :user do |config|
     config.columns = [:realname, :email,
                       :login, :password, :password_confirmation, :roles, :studentnum, :registrations]

  end
  
end
