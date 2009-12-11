class CourseFeedbacksController < ApplicationController
  
  
  
  def new
    @instance = Instance.find(params[:instance_id])
    @feedback = CourseFeedback.new
  end
  
  # takes instance_id
  def create
    cfb = CourseFeedback.new(params[:course_feedback])
    instance = Instance.find(params[:instance_id])
    
    instance.course_feedbacks << cfb
    redirect_to instance_path(instance.id)
  end
  
  
end
