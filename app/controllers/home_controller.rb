class HomeController < ApplicationController
  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).limit(16)
  end  
end
