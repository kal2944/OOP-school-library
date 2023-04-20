require_relative 'imports'

RSpec.describe Classroom do
  let(:classroom) { Classroom.new('Math 101') }
  let(:student1) { Student.new(1, 16, classroom.label) }
  let(:student2) { Student.new(2, 17, classroom.label) }
  describe '#initialize' do
    it 'creates a new classroom with the given label and an empty array of students' do
      expect(classroom.label).to eq('Math 101')
      expect(classroom.students).to eq([])
    end
  end
  describe '#add_student' do
    it 'adds the given student to the classroom and sets the student\'s classroom attribute' do
      classroom.add_student(student1)
      expect(classroom.students).to eq([student1])
      expect(student1.classroom).to eq(classroom)
      classroom.add_student(student2)
      expect(classroom.students).to eq([student1, student2])
      expect(student2.classroom).to eq(classroom)
    end
    it 'does not add the same student to the classroom more than once' do
      classroom.add_student(student1)
      classroom.add_student(student1)
      expect(classroom.students).to eq([student1])
    end
  end
end
