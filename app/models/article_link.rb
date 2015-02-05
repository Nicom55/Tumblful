class ArticleLink < ActiveRecord::Base
  validates_presence_of :url
  
  scope :ten_recent_links, lambda { order("created_at ASC").limit(10) }
  
end
