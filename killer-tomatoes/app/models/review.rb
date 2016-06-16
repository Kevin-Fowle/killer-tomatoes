class Review < ActiveRecord::Base
  acts_as_votable

  belongs_to :reviewer, class_name: "User"
  belongs_to :movie
  has_many :ratings
  has_many :raters, through: :ratings
  has_many :comments
  has_many :commenters, through: :comments

  # @Lucas - future_implementation, hiding of comments below a certain threshold
  # def qualified
  #   self.votes_for.size >= 5
  # end

  def rating
    self.get_upvotes.size - self.get_downvotes.size
  end

  def trusted
    self.rating >= 5
  end

  def untrusted
    self.rating <= -5
  end

end
