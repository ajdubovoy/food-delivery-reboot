# app.rb
require_relative "app/repositories/restaurant_repository"
require_relative "app/controllers/restaurants_controller"
restaurant_repository = RestaurantRepository.new("data/restaurants.csv")
restaurants_controller = RestaurantsController.new(restaurant_repository)

require_relative "router"
router = Router.new(restaurants_controller)

router.run
