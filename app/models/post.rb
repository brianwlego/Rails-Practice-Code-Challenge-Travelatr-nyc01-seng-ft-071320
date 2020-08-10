class Post < ApplicationRecord
  belongs_to :destination
  belongs_to :blogger
  # accepts_nested_attributes_for :blogger

def blogger_attributes=(blogger_attributes)
    blogger = Blogger.find_or_create_by(name: blogger_attributes[:name])
    self.blogger = blogger
  end

  def add_like
    self.likes += 1
  end

end
