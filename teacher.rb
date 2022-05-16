require_relative './person'

class Teacher < Person
    def initialize(name = 'Unknown', age, parent_permission: true)
        super(age, name, parent_permission)
        @specialization = specialization
    end
end