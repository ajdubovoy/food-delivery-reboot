# app/repositories/review_repository.rb
require "csv"
require "pry-byebug"
require_relative "../models/review"

class ReviewRepository
  def initialize(csv_file_path, restaurant_repository)
    @reviews = []
    @csv_file_path = csv_file_path
    @restaurant_repository = restaurant_repository
    load_csv if File.exist?(@csv_file_path)
    @next_id = @reviews.empty? ? 1 : @reviews.last.id + 1
  end

  def all
    return @reviews
  end

  def add(review)
    @reviews << review
    review.id = @next_id
    @next_id += 1
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      row[:rating] = row[:rating].to_i
      # the restaurant_id is an integer, but we want the Restaurant instance
      # We need to use RestaurantRepository#find
      restaurant_id = row[:restaurant_id].to_i
      row[:restaurant] = @restaurant_repository.find(restaurant_id)

      review = Review.new(row)
      @reviews << review
    end
  end

  def save_csv
    CSV.open(@csv_file_path, "wb") do |csv|
      csv << ["id", "content", "rating", "restaurant_id"]
      @reviews.each do |review|
        csv << [review.id, review.content, review.rating, review.restaurant.id]
      end
    end
  end
end

# TEST
# require_relative "restaurant_repository"
# restaurant_repo = RestaurantRepository.new("data/restaurants.csv")
# repo = ReviewRepository.new("data/reviews.csv", restaurant_repo)
# p repo.all

# require_relative "../models/restaurant"
# restaurant = restaurant_repo.all.first

# terrible_review = Review.new(
#   content: "It was the worst place ever...",
#   rating: 1,
#   restaurant: restaurant
# )
# repo.add(terrible_review)
# p repo
