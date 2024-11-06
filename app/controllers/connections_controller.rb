class ConnectionsController < ApplicationController
  before_action :authenticate_user! 

  def create
    @connection = current_user.connections.new(connected_user: params[:user_id], status: "pending")
    @user = User.find(params[:user_id])
    if @connection.save
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(
            "each_dev",
            partial: "connections/partial/dev",
            locals: {user: @user}
          )
        end
      end
    end
  end


end
