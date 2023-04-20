require_relative 'imports'

RSpec.describe Decorator do
  describe '#correct_name' do
    it 'returns the correct name for a person' do
      person = Person.new('1', 25, 'John Doe')
      decorator = Decorator.new(person)
      expect(decorator.correct_name).to eq('John Doe')
    end
  end
  describe '#nameable attribute' do
    it 'returns the nameable attribute of the decorator' do
      person = Person.new('1', 25, 'John Doe')
      decorator = Decorator.new(person)
      expect(decorator.nameable).to eq(person)
    end
  end
end
RSpec.describe CapitalizeDecorator do
  describe '#correct_name' do
    it 'returns the correct capitalized name for a person' do
      person = Person.new('1', 25, 'John Doe')
      decorator = CapitalizeDecorator.new(person)
      expect(decorator.correct_name).to eq('John doe')
    end
  end
end
RSpec.describe TrimmerDecorator do
  describe '#correct_name' do
    it 'returns the correct trimmed name for a person' do
      person = Person.new('1', 25, 'John Doe is a very long name')
      decorator = TrimmerDecorator.new(person)
      expect(decorator.correct_name).to eq('John Doe i...')
    end
  end
end
