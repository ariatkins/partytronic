module UsersHelper
  def image_for(user, options = { size: 100 })
    image_url = user.image
    image_tag(image_url, alt: user.name, class: "gravatar")
  end
end