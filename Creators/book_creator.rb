class BookCreator
  def self.create(app)
    print 'Enter title: '
    title = gets.chomp

    print 'Enter author: '
    author = gets.chomp

    book = Book.new(title, author)

    app.add_book(book)

    puts 'Book created successfully'
  end
end
