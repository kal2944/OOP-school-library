require './student'
require './teacher'
require './book'
require './rental'

class App
  attr_reader :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def new_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = gets.chomp

    case person_type
    when '1'
      new_student
    when '2'
      new_teacher
    else
      puts 'Invalid input'
      new_person
    end
  end

  def permission?
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase
    if parent_permission == 'y'
      true
    elsif parent_permission == 'n'
      false
    else
      puts 'Invalid input'
      permission?
    end
  end

  def new_student
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    parent_permission = permission?

    @people << Student.new(nil, age, name, parent_permission)
    puts 'Student created successfully!'
  end

  def new_teacher
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    print 'Specialization: '
    specialization = gets.chomp

    @people << Teacher.new(specialization, age, name)
    puts 'Teacher created successfully!'
  end

  def new_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    @books << Book.new(title, author)
    puts 'Book created successfully'
  end

  def list_books
    return puts 'No books available!' if @books.empty?

    @books.each_with_index do |book, index|
      puts "#{index + 1}) - Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_people
    return puts 'No people available!' if @people.empty?

    @people.each_with_index do |person, index|
      puts "#{index + 1}) - [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def new_rental
    if @books.empty?
      puts 'Book array is empty'
    elsif @people.empty?
      puts 'Person array is empty'
    else
      rental_book = select_book
      rental_person = select_person
      date = the_rental_date

      rental = Rental.new(date, @books[rental_book], @people[rental_person])

      @rentals << rental
      puts 'Rental created successfully'
    end
  end

  def select_book
    puts 'Select a book from the following list by number:'
    @books.each_with_index do |book, index|
      puts "#{index} Title: \"#{book.title}\", Author: #{book.author}"
    end
    gets.chomp.to_i
  end

  def select_person
    puts 'Select a person from the following list by number (not id):'
    @people.each_with_index do |person, index|
      puts "#{index} Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    gets.chomp.to_i
  end

  def the_rental_date
    print 'Enter rental date: '
    gets.chomp
  end

  def list_rentals
    puts 'Enter ID of person: '
    list_people
    person_id = gets.chomp.to_i
    person_rentals = @rentals.select { |rental| rental.person.id == person_id }
    return puts 'No rentals found for this ID' if person_rentals.empty?

    person_rentals.each_with_index do |rental, index|
      the_rental = "Rental #{index + 1} - Book: #{rental.book.title}"
      renter = "#{rental.book.author}, Person: #{rental.person.name}, Date: #{rental.date}"
      puts "#{the_rental} by #{renter}"
    end
  end
end
