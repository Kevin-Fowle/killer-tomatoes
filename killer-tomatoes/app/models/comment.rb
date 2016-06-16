class Comment < ActiveRecord::Base
  belongs_to :commenter, class_name: "User"
  belongs_to :review
  has_one :movie, through: :review

end
