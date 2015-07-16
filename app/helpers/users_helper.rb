module UsersHelper
  def profile_image_tag(user)
    url = user.profile_image_url || "default.png"
    image_tag(url, class: 'profile_image')
  end
end
