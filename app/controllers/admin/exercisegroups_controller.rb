class Admin::ExercisegroupsController < ApplicationController
  layout "admin"
  active_scaffold :exercisegroup
  
  before_filter :login_required
  before_filter :admin_required
  
end
