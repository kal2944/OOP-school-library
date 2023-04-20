class Rental
  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
  end
  attr_accessor :person, :book, :date
end
