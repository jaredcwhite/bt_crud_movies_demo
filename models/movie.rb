# == Schema Information
#
# Table name: movies
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  poster_img :string
#  director   :string
#  year       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Movie < ApplicationRecord
  validates :title, presence: true, uniqueness: { case_insensitive: true }

  def display_title
    "<strong>#{title}</strong>".html_safe
  end

  def relative_url
    "/movies/#{id}"
  end

  def save_omdb_details
    encoded_title = URI.encode_www_form_component(title)
    api_endpoint = "http://www.omdbapi.com/?apikey=#{ENV["OMDB_API"]}&type=movie&t=#{encoded_title}&y=#{year}"

    response = Faraday.get(api_endpoint)
    details = JSON.parse(response.body)

    update(director: director.presence || details["Director"], poster_img: details["Poster"])
  end
end
