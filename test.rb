# test.rb

require_relative 'person'
require_relative 'student'
require_relative 'teacher'

# Updated way to create instances without the 'id' parameter
person = Person.new(20, 'John') # 'id' is generated automatically, parent_permission defaults to true
puts 'Person Information:'
puts "ID: #{person.id}"
puts "Name: #{person.name}"
puts "Age: #{person.age}"
puts "Can use services? #{person.can_use_services?}"
puts ''

student = Student.new(16, 'Class A', 'Alice', false) # 'id' is generated automatically
puts 'Student Information:'
puts "ID: #{student.id}"
puts "Name: #{student.name}"
puts "Age: #{student.age}"
puts "Classroom: #{student.classroom}"
puts "Can play hooky? #{student.play_hooky}"
puts "Can use services? #{student.can_use_services?}"
puts ''

teacher = Teacher.new(30, 'Math', 'Mr. Smith', true) # 'id' is generated automatically
puts 'Teacher Information:'
puts "ID: #{teacher.id}"
puts "Name: #{teacher.name}"
puts "Age: #{teacher.age}"
puts "Specialization: #{teacher.specialization}"
puts "Can use services? #{teacher.can_use_services?}"
puts ''
