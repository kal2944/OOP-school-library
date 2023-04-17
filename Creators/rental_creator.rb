class RentalCreator
  def self.create(_app)
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

  def list_rentals_of_person
    if @rentals.empty?
      puts 'Rental is empty'
    else
      print 'Enter ID of person: '
      person_id = gets.chomp.to_i

      rentals_found = false
      @rentals.each do |rental|
        next unless rental.person.id == person_id

        rentals_found = true
        puts 'Rentals:'
        puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
      end

      puts 'No rentals found for the given person' unless rentals_found
    end
  end
end
