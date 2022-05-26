puts 'Cleaning database ...'
Movie.destroy_all

puts 'Creating movies ...'

# through Faker
# 20.times do
#   title = Faker::Movie.title
#   overview = Faker::Movie.quote
#   poster_url = Faker::Fillmurray.image
#   rating = rand(0.0..10.0).round(1)
#   attributes = { title: title, overview: overview, poster_url: poster_url, rating: rating }
#   movie = Movie.create(attributes)
#   puts "Created #{movie.title}"
# end

# through The Movie Database (Le Wagon API)
url = "http://tmdb.lewagon.com/movie/top_rated"
raw = JSON.parse(URI.open(url).read).transform_keys(&:to_sym)

(0..19).each do |idx|
  title = raw[:results][idx]["title"]
  overview = raw[:results][idx]["overview"]
  rating = raw[:results][idx]["vote_average"]
  img_path = raw[:results][idx]["poster_path"]
  poster_url = "https://image.tmdb.org/t/p/w500#{img_path}"
  attributes = { title: title, overview: overview, poster_url: poster_url, rating: rating }
  movie = Movie.create(attributes)
  puts "Created #{movie.title}"
end

puts "Finished!"
