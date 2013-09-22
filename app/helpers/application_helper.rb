module ApplicationHelper
  def logined?
    !!current_user
  end
end
