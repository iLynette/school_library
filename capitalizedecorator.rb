require_relative './nameable'

class CapitalizeDecorator < BaseDecorator
    def correct_name
        @nameable.correct_name.capitalize()
    end
end
