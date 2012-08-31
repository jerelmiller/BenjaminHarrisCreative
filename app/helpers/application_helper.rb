module ApplicationHelper
  def add_vimeo_params(base_url)
    "#{base_url}?" + { portrait: 0, byline: 0, title: 0 }.to_query
  end

  def submit_text
    return 'Create' if params[:action].eql? 'new'
    'Update'
  end
end
