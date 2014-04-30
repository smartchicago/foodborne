module ApplicationHelper
  def ga_trackable(category, action, label, options = {})
    # return data attributes for Google Analytics tracking

    classes = options.delete(:class) || ""
    classes += " ga-trackable"
    { 
      :'data-tracking-category' => category, :'data-tracking-action' => action, 
      :'data-tracking-label' => label, :'data-tracking-value' => options.delete(:tracking_value), 
      :class => classes
    }.merge(options)
  end

  def image_url(source)
    URI.join(root_url, image_path(source))
  end
end
