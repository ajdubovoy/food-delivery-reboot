# app/restaurants/restaurants_controller.rb
require_relative "../views/restaurants_view"

class RestaurantsController
  def initialize(restaurant_repository)
    @restaurant_repository = restaurant_repository
    @restaurants_view = RestaurantsView.new
  end

  def list
    # 1. Get all the restaurants
    restaurants = @restaurant_repository.all
    # 2. Display them in a pretty list
    @restaurants_view.display_list(restaurants)
  end
end

# TEST
# require_relative "../repositories/restaurant_repository"
# restaurant_repository = RestaurantRepository.new("data/restaurants.csv")
# controller = RestaurantsController.new(restaurant_repository)
# controller.list
