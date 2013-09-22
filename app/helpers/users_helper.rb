module UsersHelper
  def gravatar_for(user, options = {size: "50x50"})
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{64}&d=identicon&r=PG"
  end
end
