require "csv"
require "pry-byebug"
require_relative "../models/restaurant"

class RestaurantRepository
  def initialize(csv_file_path)
    @restaurants = []
    # ^ the most important part
    @csv_file_path = csv_file_path # "data/restaurants.csv"
    load_csv if File.exist?(@csv_file_path)
  end

  def all
    return @restaurants
  end

  def find(id)
    # should take an id as an integer
    # give you back the Restaurant instance with that id
    @restaurants.find do |restaurant|
      restaurant.id == id
    end
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      # row[:name] is already a string, no need to convert
      row[:price] = row[:price].to_i

      @restaurants << Restaurant.new(row)
    end
  end
end

# TEST
# repo = RestaurantRepository.new("data/restaurants.csv")
# p repo.all
