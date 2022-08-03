# router.rb
class Router
  def initialize(restaurants_controller)
    @restaurants_controller = restaurants_controller
    @running = true
  end

  def run
    # should start the whole application
    while @running
      print_menu
      user_choice = gets.chomp.to_i
      route_action(user_choice)
    end
  end

  private

  def print_menu
    puts "1. List all restaurants"
    puts "9. Quit"
  end

  def route_action(user_choice)
    case user_choice
    when 1 then @restaurants_controller.list
    when 9 then @running = false
    end
  end
end
