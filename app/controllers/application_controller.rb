# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  # AuthenticatedSystem must be included for RoleRequirement, and is provided by installing acts_as_authenticates and running 'script/generate authenticated account user'.
  include AuthenticatedSystem
  # You can move this into a different controller, if you wish.  This module gives you the require_role helpers, and others.
  include RoleRequirementSystem


  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  def login_required
    #if session[:user]
    if self.logged_in?
      return true
    end
    flash[:message]='Please login to continue'
    #redirect_to :controller => "session", :action => "login" # login path?
    redirect_to login_path
  end

  #def current_user
  #  session[:user]
  #end
  
  ActiveScaffold.set_defaults do |config| 
     config.ignore_columns.add [:created_at, :updated_at, :lock_version]
   end
   
   def admin_required
     current_user.has_role? :admin  
   end
   
end
