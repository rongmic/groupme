module UsersHelper
  def gravatar_for(user, options = {size: "50x50"})
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{64}&d=identicon&r=PG"
    gravatar_url
  end

  def user_avatar_path(user, options = {size: :thumb})
    return gravatar_for(user, options[:size]) if user.avatar.blank?
    user.avatar_url(options[:size])
  end
end
