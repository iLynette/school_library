class Rental
    attr_accessor :date
    attr_reader :book, :person

    def initialize(date, book, person)
        @date = date
    end
end