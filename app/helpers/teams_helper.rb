module TeamsHelper
  SIZES = { small: '16', medium: '32', large: '64', huge: '128' }
  def image_for(team, size, options = {})
    image_tag(image_path("flags/#{SIZES[size]}/#{team.iso_2}.png"), class: options[:class], alt: team.name, title: team.name)
  end
end
