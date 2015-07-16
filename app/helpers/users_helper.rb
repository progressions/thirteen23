module UsersHelper
  def profile_image_tag(user)
    url = user.profile_image_url || "default.png"
    classes = ['profile_image']
    if user == current_user
      classes << 'editable'
    end
    image_tag(url, class: classes)
  end
end
