class Admin::CoursesController < ApplicationController
  layout "admin"
  active_scaffold :course
  before_filter :login_required
  before_filter :admin_required
  
end
