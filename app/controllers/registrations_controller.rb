class RegistrationsController < ApplicationController
  
  layout "loggedin"
  
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
  
  def sendmail
    
     @eg = Exercisegroup.find(params[:id])
     msg = params[:message]
     
     if request.post?
       UserMailer.deliver_register_email(@eg.users, @eg.instance, msg)
       flash[:notice] = "Message sent to #{@eg.users.size} recipients"
       redirect_to instance_path(@eg.instance)
     end
     
     # else render view
  
  end
  

end
