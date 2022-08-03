# app/models/review.rb
class Review
  attr_reader :content, :rating, :restaurant
  attr_accessor :id

  def initialize(attributes = {})
    @id = attributes[:id]
    @content = attributes[:content]
    @rating = attributes[:rating]
    @restaurant = attributes[:restaurant] # should be a restaurant instance
  end
end

# TEST
# require_relative "restaurant"
# mcdonalds = Restaurant.new(name: "McDonald's", price: 1)

# terrible_review = Review.new(
#   content: "It was the worst place ever...",
#   rating: 1,
#   restaurant: mcdonalds
# )
# p terrible_review
