class UserController < ApplicationController

    before_filter :login_required, :only=>['welcome', 'change_password', 'edit']

    def signup
      @user = User.new(@params[:user])
      if request.post?  
        if @user.save
          session[:user] = User.authenticate(@user.login, @user.password)
          flash[:message] = "Signup successful"
          redirect_to :action => 'index', :controller => :courses          
        else
          flash[:message] = "Signup unsuccessful"
        end
      end
    end

    def login
      if request.post?
        user = User.authenticate(params[:user][:login], params[:user][:password])
        if user
          flash[:message] = "Login successful"
          session[:user] = user
          redirect_to :action => 'index', :controller => :courses
        else
          flash[:message] = "Login unsuccessful"
        end
      end
    end

    def logout
      session[:user] = nil
      flash[:message] = 'Logged out'
      redirect_to :action => 'index', :controller => :courses 
    end

    def change_password
      @user=session[:user]
      if request.post?
        @user.update_attributes(:password=>params[:user][:password], :password_confirmation => params[:user][:password_confirmation])
        if @user.save
          flash[:message]="Password Changed"
        else 
          flash[:message]="Password change failed"
        end
        redirect_to :action => 'index', :controller => :courses 
      end
    end

    def welcome
    end

end
  
