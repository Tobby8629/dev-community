module ApplicationHelper
  def connected_status(user)
    connection = current_user.connections.find_by(connected_user: user.id)
    connection ? connection.status : "no connection"
  end
end
