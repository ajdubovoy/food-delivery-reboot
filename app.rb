# app.rb
require_relative "app/repositories/restaurant_repository"
require_relative "app/controllers/restaurants_controller"
restaurant_repository = RestaurantRepository.new("data/restaurants.csv")
restaurants_controller = RestaurantsController.new(restaurant_repository)

require_relative "app/repositories/review_repository"
require_relative "app/controllers/reviews_controller"
review_repository = ReviewRepository.new("data/reviews.csv", restaurant_repository)
reviews_controller = ReviewsController.new(restaurant_repository, review_repository)

require_relative "router"
router = Router.new(restaurants_controller, reviews_controller)

router.run
