require_relative 'calendar'
require 'date'

def validate_date(string)
  format_ok = string.match(/\d{2}:\d{2}:\d{4}/)
  parseable = Date.strptime(string, '%d:%m:%Y') rescue false

  if format_ok && parseable
    true
  else
    false
  end
end

def validate_month(string)
  if string.to_i >= 1 && string.to_i <= 12
    true
  else
    false
  end
end
calendar = Calendar.new
loop do
  puts 'Pick an option'
  puts 'Press 1 to add event'
  puts 'Press 2 to delete event'
  puts 'Press 3 to edit event'
  puts 'Press 4 to print all events of a specific date'
  puts 'Press 5 to print number of events on a month'
  puts 'Press 6 to print all events on a month'

  option_from_user = gets
  option_from_user = option_from_user.to_i

  if option_from_user == 1
    puts 'Enter the name of event'
    name = gets
    puts 'Enter the description of event'
    description = gets
    puts 'Enter the date of event with Format DD:MM:YYYY'
    date = gets
    if validate_date(date)
      calendar.add_event(name, description, date)
      puts 'Event entered successfully'
    else
      puts 'Invalid Date Format. Enter date with Format DD:MM:YYYY'
    end
  elsif option_from_user == 2
    puts 'Enter the name of event'
    name = gets
    puts 'Enter the date of event with Format DD:MM:YYYY'
    date = gets
    if validate_date(date)
      calendar.remove_event(name, date)
    else
      puts 'Invalid Date Format. Enter date with Format DD:MM:YYYY'
    end
  elsif option_from_user == 3
    puts 'Enter the name of event'
    name = gets
    puts 'Enter the date of event with Format DD:MM:YYYY'
    date = gets
    puts 'Enter the new name of event'
    new_name = gets
    puts 'Enter the new description of event'
    new_description = gets
    puts 'Enter the new date of event with Format DD:MM:YYYY'
    new_date = gets
    if validate_date(date) && validate_date(new_date)
      calendar.edit_event(name, date, new_name, new_description, new_date)
    else
      puts 'Invalid Date Format. Enter date with Format DD:MM:YYYY'
    end
  elsif option_from_user == 4
    puts 'Enter the date which events you want to print with Format DD:MM:YYYY'
    date = gets
    if validate_date(date)
      events_list = calendar.get_events_of_specific_date(date)
      events_list.each { |event| print event.name.chomp + ': ' + event.description }
    else
      puts 'Invalid Date Format. Enter date with Format DD:MM:YYYY'
    end
  elsif option_from_user == 5
    puts 'Enter the month which number of events you want to print'
    month = Integer(gets.chomp) rescue nil
    until month.is_a?(Numeric)
      print 'Please enter a numeric value: '
      month = Integer(gets.chomp) rescue nil
    end
    until validate_month(month)
      puts 'Invalid Input. Enter Again'
      month = Integer(gets.chomp) rescue nil
    end
      calendar.get_no_of_events_of_month(month)
  elsif option_from_user == 6
    puts 'Enter the month which events you want to print'
    month = Integer(gets.chomp) rescue nil
    until month.is_a?(Numeric)
      print 'Please enter a numeric value: '
      month = Integer(gets.chomp) rescue nil
    end
    until validate_month(month)
      puts 'Invalid Input. Enter Again'
      month = Integer(gets.chomp) rescue nil
    end
      calendar.get_no_of_events_of_month(month)
  else
    puts 'Invalid Input'
  end
end
