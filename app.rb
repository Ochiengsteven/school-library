# app.rb

require_relative 'book'
require_relative 'person'
require_relative 'rental'

# Initialize empty arrays to store books, people, and rentals.
books = []
people = []
rentals = []

# Method to list all books.
def list_books(books)
  puts "\nList of Books:"
  books.each_with_index do |book, index|
    puts "#{index + 1}. Title: #{book.title}, Author: #{book.author}"
  end
end

# Method to list all people.
def list_people(people)
  puts "\nList of People:"
  people.each_with_index do |person, index|
    puts "#{index + 1}. Name: #{person.name}, Type: #{person.class}"
  end
end

# Method to create a student.
def create_student(people, name)
  age = ask_for_age
  parent_permission = ask_for_parent_permission

  student = Student.new(people.length + 1, name, age, parent_permission)
  people.push(student)
  puts 'Student created successfully.'
end

# Method to create a teacher.
def create_teacher(people, name)
  specialty = ask_for_specialty

  teacher = Teacher.new(people.length + 1, name, specialty)
  people.push(teacher)
  puts 'Teacher created successfully.'
end

# Method to ask for age.
def ask_for_age
  print 'Enter the age: '
  gets.chomp.to_i
end

# Method to ask for parent permission.
def ask_for_parent_permission
  print 'Does the student have parent permission? (yes/no): '
  permission = gets.chomp.downcase
  permission == 'yes' || permission == 'y'
end

# Method to ask for specialty (for teachers).
def ask_for_specialty
  print 'Enter the specialty: '
  gets.chomp
end

# Method to create a person (teacher or student).
def create_person(people)
  print 'Enter the name of the person: '
  name = gets.chomp

  puts 'Choose the type of person:'
  puts '1. Student'
  puts '2. Teacher'
  print 'Enter the type (1/2): '
  type = gets.chomp.to_i

  if type == 1
    create_student(people, name)
  elsif type == 2
    create_teacher(people, name)
  else
    puts 'Invalid choice. Person not created.'
  end
end

# Method to create a rental.
def create_rental(books, people, rentals)
  puts 'Available books:'
  list_books(books)

  print 'Enter the index of the book you want to rent: '
  book_index = gets.chomp.to_i - 1

  print 'Enter the index of the person who will rent the book: '
  person_index = gets.chomp.to_i - 1

  if book_index >= 0 && book_index < books.length && person_index >= 0 && person_index < people.length
    rental = Rental.new(Date.today, books[book_index], people[person_index])
    rentals.push(rental)
    puts 'Rental created successfully.'
  else
    puts 'Invalid book or person index. Rental not created.'
  end
end

# Method to display the main menu and handle user input.
def display_main_menu
  puts "\nOptions:"
  puts '1. List all books'
  puts '2. List all people'
  puts '3. Create a person'
  puts '4. Create a book'
  puts '5. Create a rental'
  puts '6. List all rentals for a person'
  puts '7. Quit'
end

# Method to handle user choice and execute corresponding actions.
def handle_user_choice(choice, books, people, rentals)
  case choice
  when 1
    list_books(books)
  when 2
    list_people(people)
  when 3
    create_person(people)
  when 4
    create_book(books)
  when 5
    create_rental(books, people, rentals)
  when 6
    list_rentals_for_person(rentals, people)
  when 7
    quit_app
  else
    invalid_choice
  end
end

# Method to handle invalid choice.
def invalid_choice
  puts 'Invalid choice. Please choose a valid option.'
end

# Method to quit the app.
def quit_app
  puts 'Goodbye!'
  exit(0)
end

# Main application loop.
def main(books, people, rentals)
  loop do
    display_main_menu
    print 'Enter your choice (1-7): '
    choice = gets.chomp.to_i
    handle_user_choice(choice, books, people, rentals)
  end
end

# Call the main method to start the app.
main(books, people, rentals)
