class PersonCreator
  def self.create
    print 'Enter person name: '
    name = gets.chomp

    print 'Enter person age: '
    age = gets.chomp.to_i

    print 'Does this person have parent permission? (y/n): '
    parent_permission = gets.chomp.downcase == 'y'

    if parent_permission
      Student.new('', age, name, parent_permission)
    else
      print 'Enter teacher specialization: '
      specialization = gets.chomp

      Teacher.new(name, age, specialization)
    end
  end
end
