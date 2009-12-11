class Admin::CourseFeedbacksController < ApplicationController
  layout "admin"
  active_scaffold :course_feedback
  
  before_filter :login_required
  before_filter :admin_required
  
  #active_scaffold :exe do |config|
  #   config.columns = [:name, :room, :users, :instance, :date, :start_date, :end_date]
  #end
  
  
end
