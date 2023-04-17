class RentalCreator
  def self.create(app)
    print 'Enter person id: '
    person_id = gets.chomp.to_i

    person = app.find_person(person_id)

    if person.nil?
      puts "Person with id #{person_id} not found"
      return
    end

    print 'Enter book id: '
    book_id = gets.chomp.to_i

    book = app.find_book(book_id)

    if book.nil?
      puts "Book with id #{book_id} not found"
      return
    end

    print 'Enter rental date (yyyy-mm-dd): '
    date = gets.chomp

    rental = person.add_rental(book, date)

    app.add_rental(rental)

    puts 'Rental created successfully'
  end
end
