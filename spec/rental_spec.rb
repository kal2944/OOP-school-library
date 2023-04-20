require_relative 'imports'

RSpec.describe Rental do
  let(:person) { Person.new(1, 16, 'John Doe') }
  let(:book) { Book.new('The Hitchhiker\'s Guide to the Galaxy', 'Douglas Adams') }
  let(:rental) { Rental.new('2023-04-20', book, person) }
  describe '#initialize' do
    it 'creates a new rental with the given date, book, and person' do
      expect(rental.date).to eq('2023-04-20')
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
    end
  end
  describe '#date' do
    it 'returns the rental date' do
      expect(rental.date).to eq('2023-04-20')
    end
  end
  describe '#book' do
    it 'returns the rented book' do
      expect(rental.book).to eq(book)
    end
  end
  describe '#person' do
    it 'returns the person who rented the book' do
      expect(rental.person).to eq(person)
    end
  end
  describe '#person=' do
    it 'updates the person who rented the book' do
      new_person = Person.new(2, 18, 'Jane Doe')
      rental.person = new_person
      expect(rental.person).to eq(new_person)
    end
  end
  describe '#book=' do
    it 'updates the rented book' do
      new_book = Book.new('Harry Potter and the Philosopher\'s Stone', 'J.K. Rowling')
      rental.book = new_book
      expect(rental.book).to eq(new_book)
    end
  end
end
