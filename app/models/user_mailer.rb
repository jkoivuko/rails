class UserMailer < ActionMailer::Base
  
  def register_email(users, instance, message)
      recipients    users.map(&:email)
      from          "Ilmo 2.0 <notifications@example.invalid>"
      subject       "Message about #{instance.name} of #{instance.course.name}"
      sent_on       Time.now
      body          :message => message
    end
    
    
end
