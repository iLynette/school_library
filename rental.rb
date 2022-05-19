class Rental
    attr_accessor :date
    attr_reader :book, :person

    def initialize(date, book, person)
        @date = date
        @book = book
        books.rental << self

        @person = person
        person.rental << self
    end
end