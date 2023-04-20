require_relative 'imports'

RSpec.describe Book do
  let(:book) { Book.new('The Great Gatsby', 'F. Scott Fitzgerald') }
  let(:person) { double('person') }
  let(:date) { '2023-04-20' }

  describe '#initialize' do
    it 'creates a book with the given title and author' do
      expect(book.title).to eq('The Great Gatsby')
      expect(book.author).to eq('F. Scott Fitzgerald')
    end

    it 'initializes rentals to an empty array' do
      expect(book.rentals).to eq([])
    end
  end

  describe '#add_rental' do
    it 'creates a new rental for the book and person with the given date' do
      rental = book.add_rental(person, date)
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
      expect(rental.date).to eq(date)
    end

    it 'adds the rental to the book' do
      book.add_rental(person, date)
      expect(book.rentals.size).to eq(1)
    end
  end
end
