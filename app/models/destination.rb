class Destination < ApplicationRecord
  has_many :posts
  has_many :bloggers, through: :posts

  def last_five
    self.posts.last(5)
  end

  def featured_post
    self.posts.max_by {|a| a.likes}
  end

  def average_age
    age_array = self.bloggers.map {|blogger| blogger.age}
    if age_array.any?
    result = (age_array.sum / age_array.count)
    end
  end

end
