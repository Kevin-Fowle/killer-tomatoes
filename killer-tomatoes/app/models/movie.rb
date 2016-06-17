class Movie < ActiveRecord::Base
  has_many :reviews
  has_many :reviewers, through: :reviews

  def overall_score
    self.reviews.average(:score).round(1)
  end

  def gold_score
    gold_reviews = self.reviews.select {|review|
        review.reviewer.status == "Gold" }
    gold_reviews.average(:score).round(1)
  end
end
