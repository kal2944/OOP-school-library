require './app'
require './menu'
require_relative 'Creators/person_creator'
require_relative 'Creators/book_creator'
require_relative 'Creators/rental_creator'

class Main
  def initialize
    @app = App.new
  end
  include Menu

  def choose_option
    loop do
      display_menu
      option = gets.chomp.to_i
      break if option == 7

      execute_options(option)
    end
  end

  def execute_options(option)
    case option
    when 1
      @app.list_books
    when 2
      @app.list_people
    when 3
      @app.new_person
    when 4
      @app.new_book
    when 5
      @app.new_rental
    when 6
      @app.list_rentals
    else
      puts 'Invalid option, please try again'
    end
  end

  def main
    puts 'Welcome to School library app!'
    choose_option
    puts 'Thank you for using School library app!'
  end
end

main = Main.new
main.main
