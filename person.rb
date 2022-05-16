class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(name = 'Unknown', age, parent_permission: true)
    @id = Random.rand(1...1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
 end

def is_of_age?
    if @age >= 18 return true
else 
    return false
end

private :is_of_age?






