class Movie < ActiveRecord::Base
  has_many :reviews
  has_many :reviewers, through: :reviews

  def overall_score
    self.reviews.exists? ? self.reviews.average(:score).round(1) : 0
  end

  def killer_score
    killer_reviews = self.reviews.select {|review|
        review.reviewer.status == "Killer" }
    killer_reviews.empty? ? 0 : killer_reviews.average(:score).round(1)
  end
end
