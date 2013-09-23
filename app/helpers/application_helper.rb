module ApplicationHelper
  def logined?
    !!current_user
  end

  def comments_more?(comments)
    comments.count > 4
  end
end
