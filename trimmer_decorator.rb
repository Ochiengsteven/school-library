# trimmer_decorator.rb

class TrimmerDecorator < Decorator
  def correct_name
    super[0, 10] # Trim the name to a maximum of 10 characters
  end
end
