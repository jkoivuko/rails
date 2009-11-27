class Admin::CoursesController < ApplicationController
  layout "admin"
  active_scaffold :course
end
