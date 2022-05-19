require_relative './nameable'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1...1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rentals(date, book)
    @rentals.push(Rental.new(date, self, book)) unless @rentals.include?(Rental.new(date, self, book))
  end

  def of_age?
    @age >= 18
  end

  private :of_age?
end
