class Comment < ActiveRecord::Base
  belongs_to :commenter, class_name: "User"
  belongs_to :review
  has_one :movie, through: :review

  validates :body, length: {
                              minimum: 5,
                              too_short: '%{count} characters is the minimum required'
                           }

end
