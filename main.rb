require_relative 'app'

def main
  app = App.new

  loop do
    puts "\nOptions:"
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List all rentals for a person'
    puts '7. Quit'

    print 'Enter your choice (1-7): '
    choice = gets.chomp.to_i

    case choice
    when 1
      app.list_books
    when 2
      app.list_people
    when 3
      app.create_person
    when 4
      app.create_book
    when 5
      app.create_rental
    when 6
      print 'Enter the ID of the person: '
      person_id = gets.chomp.to_i
      app.list_rentals_for_person(person_id)
    when 7
      puts 'Goodbye!'
      exit(0)
    else
      puts 'Invalid choice. Please choose a valid option.'
    end
  end
end

main
