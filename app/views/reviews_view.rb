# app/views/reviews_view.rb
class ReviewsView
  def ask_for(stuff)
    puts "Please enter the #{stuff}..."
    gets.chomp
  end
end
