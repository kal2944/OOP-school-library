require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './rental'
require_relative './classroom'
require_relative './IOstore/preserve_books'
require_relative './IOstore/preserve_people'
require_relative './IOstore/preserve_rentals'
class App
  attr_accessor :books, :people, :rentals, :classroom

  def initialize
    @books = fetch_books
    @people = fetch_people
    @rentals = fetch_rentals
  end

  include BooksPreserve
  include PeoplePreserve
  include RentalsPreserve

  def menu
    puts "\n\nWelcome to School library app"
    puts "\n1 - List all books"
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def check(options)
    case options
    when 1
      list_all_books
    when 2
      list_all_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      display_rentals_by_person_id
    end
  end

  def execute
    choice = 0
    while choice != 7
      menu
      puts
      puts
      print '[Enter 1-7]: '
      choice = gets.chomp.strip.to_i
      check(choice)
      puts
      puts
    end
    puts 'Thank you for using School library app!'
    store_books(@books)
    store_people(@people)
    store_rentals(@rentals)
  end

  def list_all_books
    if @books.empty?
      puts 'Book has not been added yet, please create a book'
    else
      @books.each_with_index do |book, index|
        puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
      end
    end
  end

  def list_all_people
    if @people.empty?
      puts 'Person has not been added yet, please create a person'
    else
      @people.each_with_index do |person, index|
        puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id} Age: #{person.age}"
      end
    end
  end

  def get_user_input(message)
    puts message
    gets.chomp.to_i
  end

  def get_user_input_string(message)
    puts message
    gets.chomp.to_s
  end

  def create_person
    person_type = get_user_input('Do you want to create a student (1) or a teacher (2)? [Input a number]:')
    case person_type
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Invalid_input'
    end
  end

  def create_student
    age = get_user_input('Age:')
    name = get_user_input_string('Name:')
    parent_permission = get_user_input_string('Has parent permission? [Y/N]:')
    case parent_permission.capitalize
    when 'Y'
      permission = true
    when 'N'
      permission = false
    else
      puts 'Invalid_input'
    end
    @people << Student.new(Random.rand(1..1000), age, nil, name, parent_permission: permission)
    puts 'Person created successfully'
  end

  def create_teacher
    # specialization = get_user_input_string('Specialization:')
    age = get_user_input('Age:')
    name = get_user_input_string('Name:')
    @people << Teacher.new(Random.rand(1..1000), age, nil, name)
    puts 'Person created successfully'
  end

  def create_book
    title = get_user_input_string('Title:')
    author = get_user_input_string('Author:')
    @books.push(Book.new(title, author))
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    list_all_books
    book_choice = gets.chomp.to_i
    while book_choice.negative? || book_choice >= @books.length
      print "Please enter a number within 0 - #{@books.length - 1} range: "
      book_choice = gets.chomp.to_i
    end
    book = "#{@books[book_choice].title} By #{@books[book_choice].author}"
    puts 'Select a person from the following list by number (not id)'
    list_all_people
    person_choice = gets.chomp.to_i
    while person_choice.negative? || person_choice >= @people.length
      print "Please enter a number within 0 - #{@people.length - 1} range: "
      person_choice = gets.chomp.to_i
    end
    person = @people[person_choice].id
    print 'Enter date of booking: (yyyy/mm/dd) : '
    date = gets.chomp.strip
    @rentals << Rental.new(date, book, person)
  end

  def display_rentals_by_person_id
    if @rentals.empty?
      puts 'Rental has not been registered yet'
    else
      print 'Person ID: '
      person_id = gets.chomp.to_i
      rentals.each do |rent|
        puts "Date: #{rent.date}, Book: #{rent.book}" if rent.person == person_id
      end
    end
  end
end
