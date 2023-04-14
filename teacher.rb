require './person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(name, age, specialization)
    super(name, age, true)
    @specialization = specialization
  end
end
