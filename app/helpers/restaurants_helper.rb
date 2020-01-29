module RestaurantsHelper

  # Returns the Gravatar for the given user.
  def image_for(restaurant, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(restaurant.name.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: restaurant.name, class: "gravatar")
  end
end  
