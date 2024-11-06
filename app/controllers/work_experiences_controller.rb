class WorkExperiencesController < ApplicationController
  before_action :authenticate_user!
  before_action :experience_find, only: [:destroy, :edit, :update]

  def new
    @experience = current_user.work_experiences.new
  end

  def edit
  end

  def update
    if @experience.update(create_params)
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(
            "experience_#{@experience.id}",
            partial: "members/partial/experience",
            locals: { experience: @experience }
          )
        end
      end
    else
     respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(
          "modal",
          partial: "shared/modal",
          locals: {form_title: "Edit work experience", form: "work_experiences/partial/edit", experience: @experience}
        )
      end
     end
    end
  end

  def create
    @experience = current_user.work_experiences.new(create_params)
    respond_to do |format|
      if @experience.save
        format.turbo_stream do
          render turbo_stream: turbo_stream.append(
            "experience_list",
            partial: "members/partial/experience",
            locals: { experience: @experience }
          )
        end
      else
        format.turbo_stream do 
          render turbo_stream: turbo_stream.replace(
            "modal",
            partial: "shared/modal",
            locals: { form_title: "Create New Experience", form: "work_experiences/partial/new", experience: @experience }
          )
        end
      end
    end
  end

  def destroy
    if @exp.destroy
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.remove("experience_#{@exp.id}")
        end
      end
    else
      Rails.logger.debug @exp.errors.full_messages.join(", ")
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
      :company
    )
  end

  def experience_find
    @experience = current_user.work_experiences.find(params[:id])
  end
end
