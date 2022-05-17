require_relative './nameable'

class BaseDecorator < Nameable
  def initialize(nameable = Nameable.new())
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end
