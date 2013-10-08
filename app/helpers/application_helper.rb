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

  def timeago(time, options = {})
    options[:class]
    options[:class] = options[:class].blank? ? "timeago" : [options[:class],"timeago"].join(" ")
    content_tag(:abbr, "", options.merge(:title => time.iso8601)) if time
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def nav_link(link_text, page, action)
    class_name = params[:action] == action ? 'active' : ''

    content_tag(:li, :class => class_name) do
      link_to link_text, page
    end
  end
end
