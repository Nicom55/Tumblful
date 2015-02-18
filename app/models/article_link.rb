class ArticleLink < ActiveRecord::Base
  validates_presence_of :url
  
  scope :ten_recent_links, lambda { order("created_at ASC").limit(10) }
  
  belongs_to :user
  
  # sets up the other side of the polymorphic association
  has_many :likes, as: :likeable
  
end
