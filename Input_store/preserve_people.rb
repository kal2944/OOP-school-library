require 'json'
module PeoplePreserve
  def store_people(people)
    student_data = []
    teacher_data = []
    student_file = './data/students.json'
    teacher_file = './data/teachers.json'
    return unless File.exist?(student_file) && File.exist?(teacher_file)

    people.each do |person|
      case person
      when Student
        student_data << { id: person.id, age: person.age, name: person.name,
                          parent_permission: person.parent_permission }
      when Teacher
        teacher_data << { id: person.id, age: person.age, name: person.name }
      end
    end
    File.write(student_file, JSON.generate(student_data))
    File.write(teacher_file, JSON.generate(teacher_data))
  end

  def fetch_people
    data = []
    student_file = './files_in_json/students.json'
    teacher_file = './files_in_json/teachers.json'

    unless File.exist?(student_file) && File.exist?(teacher_file) &&
           !File.empty?(student_file) && !File.empty?(teacher_file)
      return []
    end

    JSON.parse(File.read(student_file)).each do |student|
      data << Student.new(student['id'], student['age'], student['classroom'], student['name'],
                          parent_permission: student['parent_permission'])
    end
    JSON.parse(File.read(teacher_file)).each do |teacher|
      data << Teacher.new(teacher['id'], teacher['age'], teacher['specialization'], teacher['name'])
    end
    data
  end
end
