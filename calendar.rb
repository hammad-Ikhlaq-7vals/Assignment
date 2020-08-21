# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/AbcSize
# rubocop:disable LineLength
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
      neeventt unless event.name == name && event.date == date
      event.name = new_name
      event.description = new_description
      event.date = new_date
    end
  end

  def get_events_of_specific_date(date)
    returning_list_of_descriptions = []
    @events.each { |event| returning_list_of_descriptions << event.description if event.date == date }
    returning_list_of_descriptions
  end

  def get_no_of_events_of_month(month)
    returning_list_of_no_of_events = []
    1.upto(31) do |date|
      curr_date = ''
      count = 0
      curr_date = if month < 10
                    date.to_s + ':0' + month.to_s + ':2020'
                  else
                    curr_date = date.to_s + ':' + month.to_s + ':2020'
                  end

      @events.each do |event|
        count += 1 if event.date == curr_date
      end

      puts curr_date + " \t =" + count.to_s
      returning_list_of_no_of_events << count
    end
    returning_list_of_no_of_events
  end

  def get_description_of_events_of_month(month)
    returning_list_of_descriptions_of_all_month = []
    1.upto(31) do |date|
      curr_date = ''
      curr_date = if month < 10
                    date.to_s + ':0' + month.to_s + ':2020'
                  else
                    date.to_s + ':' + month.to_s + ':2020'
                  end
      puts curr_date + ":\n\n"

      @events.each do |event|
        puts event.description if event.date == curr_date
        puts "\n"
        returning_list_of_descriptions_of_all_month << event.description
      end
    end
    returning_list_of_descriptions_of_all_month
  end
end
