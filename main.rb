require './app'
require './menu'
require_relative 'Creators/person_creator'
require_relative 'Creators/book_creator'
require_relative 'Creators/rental_creator'

def main
  app = App.new

  puts 'Welcome to School Library App!'
  puts ''

  loop do
    Menu.display
    option = gets.chomp

    if option == '7'
      puts 'Thank you for using this app!'
      break
    end

    options(option, app)
  end
end

def options(option, app)
  case option
  when '1' then app.list_books
  when '2' then app.list_people
  when '3' then app.new_person
  when '4' then app.new_book
  when '5' then app.new_rental
  when '6' then app.list_rentals
  else
    puts 'That is not a valid option'
  end
end

main
