module ApplicationHelper
  def submit_text
    return 'Create' if params[:action].eql? 'new'
    'Update'
  end
end
