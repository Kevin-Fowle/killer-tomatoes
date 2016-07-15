class Review < ActiveRecord::Base
  acts_as_votable

  belongs_to :reviewer, class_name: "User"
  belongs_to :movie
  has_many :comments
  has_many :commenters, through: :comments

  validates :title, presence: true
  validates :title, length: {
                              minimum: 3,
                              too_short: '%{count} characters is the minimum required'
                            }
  validates :body, length: {
                              minimum: 25,
                              too_short: '%{count} characters is the minimum required'
                           }


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
