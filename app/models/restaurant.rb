class Restaurant
  attr_reader :name, :price
  attr_accessor :id

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @price = attributes[:price]
  end
end

# empty_restaurant = Restaurant.new
# p empty_restaurant

# charlotte = Restaurant.new(name: "Charlotte I", price: 2)
# p charlotte.name
# p charlotte.id
# charlotte.id = 1
# p charlotte