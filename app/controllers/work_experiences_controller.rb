class WorkExperiencesController < ApplicationController
  before_action :authenticate_user!
  before_action :experience_find, only: [:destroy]
  def new
    @experience = current_user.work_experiences.new
  end

  def create
    @create_experience = current_user.work_experiences.new(create_params)
    
    if @create_experience.save
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.append("experience_list", partial: "members/partial/experience", locals: { experience: @create_experience })
        end
      end
    else
      # Log errors if the save fails
      Rails.logger.debug @create_experience.errors.full_messages.join(", ")
      # Optionally render errors or a response to handle the failure
    end
  end


  def destroy
    @exp = current_user.work_experiences.find(params[:id])
    if @exp.destroy
        respond_to do |format|
          format.turbo_stream do
              render turbo_stream: turbo_stream.remove("experience_#{@exp.id}")
          end
        end
    else
      Rails.logger.debug @exp.errors.full_messages.join(", ")
        # Handle errors if the experience could not be deleted
    end
  end
    
    
    

    private 
    def create_params
      params.require(:work_experience).permit(
        :start_date,
        :end_date,
        :job_title,
        :employment_type,
        :location,
        :location_type,
        :currently_working,
        :description,
        :company,
      )
    end

    def experience_find
      @exp = current_user.work_experiences.find(params[:id])
    end
    
  end
