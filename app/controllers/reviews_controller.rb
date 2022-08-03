require_relative "../views/restaurants_view"
require_relative "../views/reviews_view"
require_relative "../models/review"

class ReviewsController
  def initialize(restaurant_repository, review_repository)
    @restaurant_repository = restaurant_repository
    @restaurants_view = RestaurantsView.new

    @review_repository = review_repository
    @reviews_view = ReviewsView.new
  end

  def create
    # Ask the user for the restaurant
    restaurant_they_picked = get_restaurant
    # Ask the user to type the content of their review.
    content_they_typed = @reviews_view.ask_for("content")
    # Ask the user to type a rating for their review.
    rating_they_typed = @reviews_view.ask_for("rating").to_i
    # Take the information the user typed and build a new Review instance based on it.
    review = Review.new(
      content: content_they_typed,
      rating: rating_they_typed,
      restaurant: restaurant_they_picked
    )
    restaurant_they_picked.add_review(review)
    # Save that review to the repository.
    @review_repository.add(review)
  end

  private

  def get_restaurant
    # Fetch all the restaurants in the app from the repository.
    restaurants = @restaurant_repository.all
    # Display the user a numbered list of all the restaurants in the app.
    @restaurants_view.display_list(restaurants)
    # Ask the user to type the index of the restaurant they want to write a review for.
    index_they_typed = @reviews_view.ask_for("index").to_i - 1
    return restaurants[index_they_typed]
  end
end
