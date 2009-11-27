class Admin::UserController < ApplicationController
  layout "admin"
  active_scaffold :user
end
