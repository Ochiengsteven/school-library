class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label)
    @label = label
    @students = [] # Initialize an empty array to hold students
  end

  def add_student(student)
    @students.push(student)
    student.classroom = self
  end

  def remove_student(student)
    @students.delete(student)
    student.classroom = nil
  end
end
