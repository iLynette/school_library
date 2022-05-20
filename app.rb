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
end
