class Blogger < ApplicationRecord
  has_many :posts
  has_many :destinations, through: :posts

  def get_like_total
    self.posts.map {|post| post.likes}.sum.to_s
  end

  def featured_post
    self.posts.max_by {|a| a.likes}
    # self.posts.max_by {|a, b| a.likes <=> b.likes}
  end

end
