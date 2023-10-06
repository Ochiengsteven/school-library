require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(id, classroom, age = 0, name = 'Unknown', parent_permission: true)
    super(id, name, age, parent_permission)
    @classroom = classroom
    classroom.add_student(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
