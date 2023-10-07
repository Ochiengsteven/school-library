require_relative 'nameable'
require_relative 'rental'

class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(id, name = 'Unknown', age = 0, parent_permission: true, nameable: nil)
    super(nameable)
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = nil
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_service?
    of_age? || @parent_permission == true
  end

  def correct_name
    name
  end

  def add_rental(rental)
    @rentals ||= []
    @rentals.push(rental)
  end
end
