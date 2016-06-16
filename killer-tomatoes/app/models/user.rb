class User < ActiveRecord::Base
  # acts_as_voter

  has_many :reviews, foreign_key: 'reviewer_id'
  has_many :reviewed_movies, through: :reviews, source: :movies
  has_many :comments, foreign_key: "commenter_id"
  has_many :ratings, foreign_key: "rater_id"
  has_secure_password
end
