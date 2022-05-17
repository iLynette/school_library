require_relative './nameable'

class BaseDecorator < Nameable
    def initialize(nameable)
        super()
        @nameable = nameable
    end
end