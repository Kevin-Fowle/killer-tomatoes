class User < ActiveRecord::Base
  acts_as_voter

  has_many :reviews, foreign_key: 'reviewer_id'
  has_many :reviewed_movies, through: :reviews, source: :movies
  has_many :comments, foreign_key: "commenter_id"
  has_many :ratings, foreign_key: "rater_id"
  has_secure_password

  def num_trusted_reviews
    self.reviews.select {|review| review.trusted}.length
  end

  def num_untrusted_reviews
    self.reviews.select {|review| review.untrusted}.length
  end

  def net_trust_score
    self.num_trusted_reviews - self.num_untrusted_reviews
  end

  def status
    case
    when net_trust_score >= 10
      "Gold"
    when net_trust_score >= 5
      "Silver"
    when net_trust_score <= -10
      "Untrusted"
    else
      "Tomato"
    end
  end



end
