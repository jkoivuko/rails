class UsersController < ApplicationController
   
  before_filter :login_required, :except => [:new, :create] 
  before_filter :check_user, :except => [:new, :create]
  
  layout "loggedin" unless session.nil?

  
  # render new.rhtml
  def new
    @user = User.new
  end
 
  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    success = @user && @user.save
    if success && @user.errors.empty?
      self.current_user = @user # !! now logged in
      
      Newsfeed.append("#{current_user.realname} just created account!")
      
      redirect_back_or_default('/')
      else
      flash[:notice]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
      render :action => 'new'
    end
  end
  
  def profile
  
  end
  
  # /user/be_friend_with/:id
  #def be_friend_with
  #  current_user.be_friend_with(:id)
  #end
     
end
