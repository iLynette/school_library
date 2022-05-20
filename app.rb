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

    # list all books
    def list_books
        if @books.empty?
            puts 'Sorry, no books available, please add a book'
        else
            @books.each_with_index do | book, index|
                puts "#{index + 1}) Title: \"#{book.title}\" | Author: #{book.author}"
            end
        end

        # list all people
        def list_people
            if @people.empty?
                puts 'No people added yet, please add a person'
            else
                @people.each_with_index do | person, index|
                    puts "#{index + 1})[#{person.class.name}] Name: #{person.name}, Age: #{person.age} | ID: #{person.id}"
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
                print 'Specialization:'
                person = gets.chomp
                create_teacher(person, name, age)
            when '2'
                print 'Class:'
                grade = gets.chomp
                create_teacher(grade, name, age)
            else
                puts ''
                puts 'Invalid, please try again'
            end
        end
end
