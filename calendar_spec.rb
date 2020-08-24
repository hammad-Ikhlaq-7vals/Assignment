require_relative 'calendar'
describe Calendar, 'basic scoring' do
  it 'Users can add an event to a specific date in a calendar.' do
    calendar = Calendar.new
    created_event = calendar.add_event('meeting1', '11:20 AM in office', '30:10:2020')
    expect(created_event[0].name).to   eq('meeting1')
  end

  it 'Users can remove an event to a specific date in a calendar.' do
    calendar = Calendar.new
    created_event = calendar.add_event('meeting1', '11:20 AM in office', '30:10:2020')
    calendar.add_event('meeting2', '12:20 AM in home', '20:11:2020')
    calendar.add_event('meeting3', '10:20 AM in school', '10:12:2020')
    deleted_event = calendar.remove_event('meeting1', '30:10:2020')
    expect(deleted_event).to eq(created_event)
  end

  it 'Users can edit an event to a specific date in a calendar.' do
    calendar = Calendar.new
    calendar.add_event('meeting1', '11:20 AM in office', '30:10:2020')
    calendar.edit_event('meeting1', '30:10:2020', 'MEETING0', 'hahaha', '20:20:20')
    expect(calendar.events[0].name).to eq('MEETING0')
    expect(calendar.events[0].description).to eq('hahaha')
    expect(calendar.events[0].date).to eq('20:20:20')
  end

  it 'Users can print the month view (in a calendar style) which will show the number of events on each date.' do
    calendar = Calendar.new
    calendar.add_event('meeting1', '11:20 AM in office', '30:10:2020')
    calendar.add_event('meeting2', '12:20 AM in home', '10:11:2020')
    calendar.add_event('meeting3', '10:20 AM in school', '10:11:2020')
    no_of_events = calendar.get_no_of_events_of_month(11)
    expect(no_of_events[9]).to eq(2)
  end
  it 'Users can print the details of events on a specific date.' do
    calendar = Calendar.new
    calendar.add_event('meeting1', '11:20 AM in office', '30:10:2020')
    calendar.add_event('meeting2', '12:20 AM in home', '20:11:2020')
    calendar.add_event('meeting3', '10:20 AM in school', '30:10:2020')
    events_of_date = calendar.get_events_of_specific_date('30:10:2020')
    expect(events_of_date[1].description).to eq('10:20 AM in school')
    expect(events_of_date[0].description).to eq('11:20 AM in office')
  end
  it 'Users can view the details of all the events of a month.' do
    calendar = Calendar.new
    calendar.add_event('meeting1', '11:20 AM in office', '30:11:2020')
    calendar.add_event('meeting2', '12:20 AM in home', '20:11:2020')
    calendar.add_event('meeting3', '10:20 AM in school', '10:11:2020')
    description_of_events = calendar.get_description_of_events_of_month(11)
    expect(description_of_events[0].description).to eq('11:20 AM in office')
  end
end
