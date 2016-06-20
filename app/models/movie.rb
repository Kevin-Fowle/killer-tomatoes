class Movie < ActiveRecord::Base
  has_many :reviews
  has_many :reviewers, through: :reviews

  validates :title, presence: true, uniqueness: true
  validates :genre, presence: true
  validates :description, presence: true
  validates :image, presence: true

  def overall_score
    self.reviews.exists? ? self.reviews.average(:score).round(1) : 0
  end

  def killer_score
    killer_reviews = self.reviews.select {|review|
        review.reviewer.status == "Killer" }
    total = 0
    killer_reviews.each do |review|
      total += review.score
    end
    killer_reviews.length == 0 ? 0 : (total / killer_reviews.length)

    # killer_reviews.empty? ? 0 : killer_reviews.average(:score).round(1)
  end

end
