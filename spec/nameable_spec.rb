require_relative 'imports'

describe Nameable do
  context 'when correct_name is called on a Nameable object' do
    nameable = Nameable.new

    it 'should be a Nameable' do
      expect(nameable).to be_a(Nameable)
    end

    it 'raises a NotImplementedError' do
      expect { nameable.correct_name }.to raise_error(NotImplementedError)
    end
  end
end
