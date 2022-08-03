# app/views/restaurants_view.rb
class RestaurantsView
  def display_list(restaurants)
    restaurants.each_with_index do |restaurant, index|
      euro_signs = "€" * restaurant.price
      puts "#{index + 1}. #{restaurant.name} #{euro_signs}"

      puts "What people said:"
      restaurant.reviews.each do |review|
        stars = "⭐" * review.rating
        puts "#{stars} #{review.content}"
      end

      puts "----"
    end
  end
end
