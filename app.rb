require_relative 'book'
require_relative 'person'
require_relative 'rental'

class Student < Person
  def initialize(id, name, age, parent_permission)
    super(id, name, age)
    @parent_permission = parent_permission
  end
end

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_books
    puts "\nBooks:"
    @books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_people
    puts "\nPeople:"
    @people.each do |person|
      puts "ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
    end
  end

  def create_person
    print 'Enter the name of the person: '
    name = gets.chomp

    print 'Enter the age of the person: '
    age = gets.chomp.to_i

    print 'Does the person have parent permission? (y/n): '
    parent_permission = gets.chomp.downcase == 'y'

    print 'Is the person a student or a teacher? (student/teacher): '
    type = gets.chomp.downcase

    if type == 'student'
      create_student(name, age, parent_permission)
    elsif type == 'teacher'
      create_teacher(name, age, parent_permission)
    else
      puts 'Invalid person type. Person not created.'
    end
  end

  def create_student(name, age, parent_permission)
    student = Student.new(@people.length + 1, name, age, parent_permission)
    @people.push(student)
    puts 'Student created successfully.'
  end

  def create_teacher(name, age, parent_permission)
    teacher = Teacher.new(@people.length + 1, name, age, parent_permission)
    @people.push(teacher)
    puts 'Teacher created successfully.'
  end

  def create_book
    print 'Enter the title of the book: '
    title = gets.chomp

    print 'Enter the author of the book: '
    author = gets.chomp

    book = Book.new(@books.length + 1, title, author)
    @books.push(book)
    puts 'Book created successfully.'
  end

  def create_rental
    puts 'Available books:'
    list_books

    print 'Enter the index of the book you want to rent: '
    book_index = gets.chomp.to_i - 1

    print 'Enter the index of the person who will rent the book: '
    person_index = gets.chomp.to_i - 1

    if valid_book_index?(book_index) && valid_person_index?(person_index)
      rental = Rental.new(Date.today, @books[book_index], @people[person_index])
      @rentals.push(rental)
      puts 'Rental created successfully.'
    else
      puts 'Invalid book or person index. Rental not created.'
    end
  end

  def list_rentals_for_person(person_id)
    person = @people.find { |p| p.id == person_id }
    if person
      puts "\nRentals for #{person.name}:"
      rentals = @rentals.select { |rental| rental.person == person }
      rentals.each do |rental|
        puts "Book: #{rental.book.title}, Date: #{rental.date}"
      end
    else
      puts "Person with ID #{person_id} not found."
    end
  end

  private

  def valid_book_index?(index)
    index >= 0 && index < @books.length
  end

  def valid_person_index?(index)
    index >= 0 && index < @people.length
  end
end
