class TextPost < ActiveRecord::Base
  
  def title
    if body
      body.split[0..9].join(" ")
    else
      "No Title Given"
    end
  end
  
  # Set up of the other side of the polymorphic association
  has_many :likes, as: :likeable
  
end
