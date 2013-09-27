module GroupsHelper
  def group_image_path(group, options = {size: :thumb})
    return "default-group-cover.jpg" if group.image.blank?
    group.image_url(options[:size])
  end
end
