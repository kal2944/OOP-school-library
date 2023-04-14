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
    when ''
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
    puts 'Select a book from the following list by number'
    list_books
    book_index = gets.chomp.to_i - 1

    puts 'Select a person from the following list by number (not id)'
    list_people
    person_index = gets.chomp.to_i - 1

    puts 'Date: '
    date = gets.chomp

    @rentals << Rental.new(date, @books[book_index], @people[person_index])
    puts 'Rental created successfully'
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
