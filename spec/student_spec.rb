require_relative 'imports'

RSpec.describe Student do
  let(:classroom) { Classroom.new('Math') }
  let(:student) { Student.new(1, 16, classroom) }

  describe '#initialize' do
    it 'creates a new student with the given id, age, and classroom' do
      expect(student.id).to eq(1)
      expect(student.age).to eq(16)
      expect(student.classroom).to eq(classroom)
      expect(student.classroom.label).to eq('Math') # add this line to test the label
    end
  end

  describe '#play_hooky' do
    it 'returns a string indicating the student is playing hooky' do
      expect(student.play_hooky).to eq('¯(ツ)/¯')
    end
  end

  describe '#classroom=' do
    let(:new_classroom) { Classroom.new('Science') }

    it 'assigns the student to a new classroom' do
      student.classroom = new_classroom
      expect(student.classroom).to eq(new_classroom)
    end

    it 'adds the student to the new classroom' do
      student.classroom = new_classroom
      expect(new_classroom.students).to include(student)
    end

    it 'does not add the student to the old classroom' do
      old_classroom = student.classroom
      student.classroom = new_classroom
      expect(old_classroom.students).not_to include(student)
    end

    it 'does not add the student to the new classroom if they are already a member' do
      student.classroom = classroom
      expect(classroom.students).to eq([student])
    end
  end
end
