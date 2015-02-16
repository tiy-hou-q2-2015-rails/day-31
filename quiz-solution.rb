require 'json'

data = File.read("./movies.json")
movies_data = JSON.parse(data)

movies_data["movies"]
  .sort_by {|j| j["ratings"]["critics_score"] }
  .each do |worst_movie|
    puts "#{worst_movie["title"]} scored a #{worst_movie["ratings"]["critics_score"]}"
  end
