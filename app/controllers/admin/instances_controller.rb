class Admin::InstancesController < ApplicationController
  layout "admin"
  active_scaffold :instance
end
