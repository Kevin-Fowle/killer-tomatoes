require "http"
require "json"

module MoviesHelper

  def get_movie_info(title)
    p_title = title.gsub(/\s/, '+')
    JSON.parse(HTTP.get("http://www.omdbapi.com/?t=#{p_title}&y=&plot=full&r=json"))
  end

end
