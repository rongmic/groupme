module ApplicationHelper
  def logined?
    !!current_user
  end

  def comments_more?(comments)
    comments.count > 4
  end

  def title(page_title)
    content_for :title, page_title.to_s
  end

  def owner?(group)
    return false if group.blank? or not logined?
    group.owner == current_user
  end

  def author?(topic)
    return false if topic.blank? or not logined?
    topic.user == current_user
  end

  def liked?(topic)
    return false if topic.blank?
    topic.likers.include?(current_user)
  end
end
