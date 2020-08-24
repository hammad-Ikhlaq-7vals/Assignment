require_relative 'event'
# This class is implementing Calendar
class Calendar
  attr_reader :events

  def initialize
    @events = []
  end

  def add_event(name, description, date)
    @events << Event.new(name, description, date)
  end

  def remove_event(name, date)
    @events.delete_if { |event| event.name == name && event.date == date }
  end

  def edit_event(name, date, new_name, new_description, new_date)
    @events.each do |event|
      next unless event.name == name && event.date == date
      event.name = new_name
      event.description = new_description
      event.date = new_date
    end
  end

  def get_events_of_specific_date(date)
    returning_list_of_events = []
    @events.each { |event| returning_list_of_events << event if event.date == date }
    returning_list_of_events
  end

  def get_no_of_events_of_month(month)
    returning_list_of_no_of_events = []
    (1..31).each do |date|
      count = 0
      curr_date = if month < 10
                    date.to_s + ':0' + month.to_s + ':2020'
                  else
                    date.to_s + ':' + month.to_s + ':2020'
                  end

      @events.each { |event| count = count + 1 if event.date.chomp == curr_date }

      puts curr_date + " \t =" + count.to_s
      returning_list_of_no_of_events << count
    end
    returning_list_of_no_of_events
  end

  def get_description_of_events_of_month(month)
    returning_list_of_events_of_all_month = []
    (1..31).each do |date|
      curr_date = if month < 10
                    date.to_s + ':0' + month.to_s + ':2020'
                  else
                    date.to_s + ':' + month.to_s + ':2020'
                  end
      puts curr_date + ":\n\n"

      @events.each do |event|
        puts event.description if event.date.chomp == curr_date
        puts "\n"
        returning_list_of_events_of_all_month << event
      end
    end
    returning_list_of_events_of_all_month
  end
end
