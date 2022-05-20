require_relative './book'
require_relative './classroom'
require_relative './decorator'
require_relative './person'
require_relative './rental'
require_relative './student'
require_relative './teacher'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def start
    selection
  end

  # list all books
  def list_books
      puts "Sorry, there are #{@books.count} book(s) available"
      @books.each_with_index do |book, index|
        puts "#{index + 1}) Title: \"#{book.title}\" | Author: #{book.author}"
      end
    end

    # list all people
    def list_people
      puts 'No people added yet, please add a person' if @people.empty?
      @people.each_with_index do |person, index|
        puts "#{index + 1})[#{person.class}] Name: #{person.name} | Age: #{person.age} | ID: #{person.id}"
      end
    end

  # create a person
  def create_person
    print 'Would you like to create a student (1) or a teacher (2)? Select a number:'
    selection = gets.chomp
    print 'Name:'
    name = gets.chomp
    print 'Age:'
    age = gets.chomp.to_i
    case selection
    when '1'
      print 'Class:'
      person = gets.chomp
      create_student(person, name, age)
    when '2'
      print 'Specialization:'
      grade = gets.chomp
      create_teacher(grade, name, age)
    else
      puts ''
      puts 'Invalid, please try again'
      nil
    end
  end

  def create_student(grade, name, age)
    print 'Parent permission? [Y/N]'
    option = gets.chomp.downcase
    case option
    when 'y'
      student = Student.new(grade, name, age, parent_permission: true)
    when 'n'
      student = Student.new(grade, name, age, parent_permission: false)
    else
      puts 'Invalid option, please try again'
      return
    end
    @people << student
    puts ''
    puts "Student is created successfully ID is #{student.id}"
  end

  def create_teacher(specialization, name, age)
    teacher = Teacher.new(specialization, name, age)
    @people << teacher
    puts ''
    puts "Teacher created successfully. Teacher ID is #{teacher.id}"
  end

  # create a book
  def create_book
    print 'Title:'
    title = gets.chomp
    print 'Author:'
    author = gets.chomp

    if title.strip != '' && author.strip != ''
      book = Book.new(title, author)
      @books << book
      puts ''
      puts 'Book created successfully'
    else
      puts ''
      puts 'Enter book title and author'
    end
  end

  def create_rental
    if @books.empty? && @people.empty?
      puts 'Nothing to see here'
    else
      puts 'Press the number of the book you want: '
      @books.each_with_index do |book, index|
        puts "#{index + 1}) Title: \"#{book.title}\" | Author: #{book.author}"
      end
      number = gets.chomp.to_i
      index = number - 1

      puts 'Type your ID: '
      @people.each { |person|
        puts "[#{person.class}] Name: #{person.name} | Age: #{person.age} | ID: #{person.id}"
      }
      identity = gets.chomp.to_i

      individual = @people.select { |person| person.id == identity }.first

      print 'Enter the date[yyyy-mm-dd]: '
      date = gets.chomp.to_s

      rent = Rental.new(date, @books[index], individual)
      @rentals << rent

      puts 'Book rented successfully'
    end
  end

  def list_all_rentals
      puts 'No rentals available at the moment' if @rentals.empty?
      print 'To view your rentals, type your ID: '
      id = gets.chomp.to_i
      rental = @rentals.select { |rend| rend.person.id == id }
      if rental.empty?
        puts 'No records for that ID'
      else
        puts 'Here are your records: '
        puts ''
        rental.each_with_index do |record, index|
          puts "#{index + 1}| Date: #{record.date} | Borrower: #{record.person.name}
                 | Status: #{record.person.class} | Borrowed book: \"#{record.book.title}\" by #{record.book.author}"
        end
      end
    end
    def list_selections
      puts ''
      puts "Please choose an option by selecting a number:
                1. List all books
                2. List all people
                3. Create person account
                4. Create a book
                5. Create a rental
                6. List all rentals for a given person ID
                7. Exit"
      gets.chomp
    end
end