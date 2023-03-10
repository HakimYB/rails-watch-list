# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'open-uri'
require "json"

puts "Cleaning database..."
Movie.destroy_all


puts "Creating Movies..."
url = "https://tmdb.lewagon.com/movie/top_rated"
movies = JSON.parse(URI.open(url).read)

movies["results"].each do |movie|
  title = movie["original_title"]
  overview = movie["overview"]
  poster = "http://image.tmdb.org/t/p/w500" + movie["poster_path"]
  Movie.create!(title:, overview:, poster_url: poster, rating: rand(0.0..9.9).round(1))
end

puts "Finished!"
