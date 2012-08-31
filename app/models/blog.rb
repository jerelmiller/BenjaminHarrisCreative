class Blog < ActiveRecord::Base
  attr_accessible :title, :body, :created_at

  def blog_name
    title.downcase.split(' ').join('-')
  end
end
