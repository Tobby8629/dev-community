class MembersController < ApplicationController
  before_action :authenticate_user! 
  def show
    @user = User.find(params[:id]) 
  end

  def edit_user_profile 
  end

  def edit_user_about
  end

  def profile
  end

  def update_profile
    if current_user.update(update_profile_params)
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(
            "user_profile",
            partial: "members/user_profile",
          )
        end
      end
    end
  end

  def update_about
    if current_user.update(about: params[:user][:about])
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(
            "user_about", 
            partial: "members/user_about", 
            locals: { user: current_user } 
          )
        end
      end
    end
  end
  
  private
    def update_profile_params
      params.require(:user).permit(:profile_title, :first_name, :last_name, :city, :state, :country, :zipcode)
    end
end
