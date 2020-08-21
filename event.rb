# Event class to capture event
class Event
  attr_reader :name, :description, :date
  attr_accessor :name, :description, :date

  def initialize(name, description, date)
    @name = name
    @description = description
    @date = date
  end
end
