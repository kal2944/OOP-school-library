require './nameable'

class Person < Nameable
  attr_accessor :age
  attr_reader :id

  def initialize(age, parent_permission: true, name: 'Unknown')
    super(name)
    @id = rand(1..1000)
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end
