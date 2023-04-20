require_relative 'imports'

RSpec.describe Teacher do
  let(:teacher) { Teacher.new(1, 35, 'Math') }
  describe '#initialize' do
    it 'creates a new teacher with the given id, age, and specialization' do
      expect(teacher.id).to eq(1)
      expect(teacher.age).to eq(35)
      expect(teacher.name).to eq('Unknown')
      expect(teacher.specialization).to eq('Math')
    end
  end
  describe '#can_use_services?' do
    it 'returns true, since teachers can use services regardless of age or parent permission' do
      expect(teacher.can_use_services?).to be(true)
    end
  end
end
