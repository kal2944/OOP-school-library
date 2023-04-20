require_relative 'imports'

RSpec.describe Person do
  let(:person) { Person.new(1, 20, 'John Doe') }
  let(:book) { Book.new('The Great Gatsby', 'F. Scott Fitzgerald') }
  let(:date) { '2023-04-20' }

  describe '#initialize' do
    it 'creates a person with the given id, age, and name' do
      expect(person.id).to eq(1)
      expect(person.age).to eq(20)
      expect(person.name).to eq('John Doe')
    end

    it 'initializes rentals to an empty array' do
      expect(person.rentals).to eq([])
    end

    it 'initializes parent_permission to true by default' do
      expect(person.parent_permission).to eq(true)
    end
  end

  describe '#of_age?' do
    it 'returns true if the person is 18 or older' do
      expect(person.of_age?).to eq(true)
    end

    it 'returns false if the person is under 18' do
      person = Person.new(2, 17, 'Jane Doe')
      expect(person.of_age?).to eq(false)
    end
  end

  describe '#can_use_services?' do
    it 'returns true if the person is 18 or older' do
      expect(person.can_use_services?).to eq(true)
    end

    it 'returns true if the person is under 18 and has parent permission' do
      person = Person.new(2, 17, 'Jane Doe', parent_permission: true)
      expect(person.can_use_services?).to eq(true)
    end

    it 'returns false if the person is under 18 and does not have parent permission' do
      person = Person.new(2, 17, 'Jane Doe', parent_permission: false)
      expect(person.can_use_services?).to eq(false)
    end
  end

  describe '#add_rental' do
    it 'creates a new rental for the person and book with the given date' do
      book = Book.new('The Great Gatsby', 'F. Scott Fitzgerald')
      person.add_rental(book, '2023-04-20')
      expect(person.rentals.length).to eq(1)
      expect(person.rentals[0].book).to eq(book)
      expect(person.rentals[0].date).to eq('2023-04-20')
      expect(person.rentals[0].person).to eq(person)
    end

    it 'adds the rental to the person' do
      expect do
        person.add_rental(book, date)
      end.to change { person.rentals.size }.from(0).to(1)
    end
  end
end
