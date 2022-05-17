require_relative './decorator'

class TrimmerDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name[0...10]
  end
end
