class RegistrationsController < ApplicationController

  def new
    eg = Exercisegroup.find(params[:id])
    
    if (eg.register_user(current_user))
      flash[:notice] = "Registration successfully"
    else
      flash[:notice] = "Registration failed"
    end
    
    redirect_to instance_path(eg.instance)
    
  end

  def view
    #eg = 
  
  end
  
  def mail
  
  end
  

end
