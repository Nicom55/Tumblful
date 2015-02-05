class TextPost < ActiveRecord::Base
  
  def title
    if body
      body.split[0..9].join(" ")
    end
  end
  
end
