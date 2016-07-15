module ReviewsHelper

  def sorted_reviews_by_rating
    @reviews.sort {|a,b| b.rating <=> a.rating }
  end

end
