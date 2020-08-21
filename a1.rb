require_relative 'calendar'
# rubocop:disable LineLength
describe Calendar, 'basic scoring' do
  it 'Users can add an event to a specific date in a calendar.' do
    my_cal = Calendar.new
    created_obj = my_cal.add_event('meeting1', '11:20 AM in office', '30:10:2020')
    expect(created_obj[0].name).to   eq('meeting1')
  end

  it 'Users can remove an event to a specific date in a calendar.' do
    my_cal = Calendar.new
    created_obj = my_cal.add_event('meeting1', '11:20 AM in office', '30:10:2020')
    my_cal.add_event('meeting2', '12:20 AM in home', '20:11:2020')
    my_cal.add_event('meeting3', '10:20 AM in school', '10:12:2020')
    deleted_obj = my_cal.remove_event('meeting1', '30:10:2020')
    expect(deleted_obj).to eq(created_obj)
  end

  it 'Users can edit an event to a specific date in a calendar.' do
    my_cal = Calendar.new
    my_cal.add_event('meeting1', '11:20 AM in office', '30:10:2020')
    my_cal.edit_event('meeting1', '30:10:2020', 'MEETING0', 'hahaha', '20:20:20')
    expect(my_cal.events[0].name).to eq('MEETING0')
    expect(my_cal.events[0].description).to eq('hahaha')
    expect(my_cal.events[0].date).to eq('20:20:20')
  end

  it 'Users can print the month view (in a calendar style) which will show the number of events on each date.' do
    my_cal = Calendar.new
    my_cal.add_event('meeting1', '11:20 AM in office', '30:10:2020')
    my_cal.add_event('meeting2', '12:20 AM in home', '10:11:2020')
    my_cal.add_event('meeting3', '10:20 AM in school', '10:11:2020')
    array = my_cal.get_no_of_events_of_month(11)
    expect(array[9]).to eq(2)
  end
  it 'Users can print the details of events on a specific date.' do
    my_cal = Calendar.new
    my_cal.add_event('meeting1', '11:20 AM in office', '30:10:2020')
    my_cal.add_event('meeting2', '12:20 AM in home', '20:11:2020')
    my_cal.add_event('meeting3', '10:20 AM in school', '30:10:2020')
    ans = my_cal.get_events_of_specific_date('30:10:2020')
    expect(ans[1]).to eq('10:20 AM in school')
    expect(ans[0]).to eq('11:20 AM in office')
  end
  it 'Users can view the details of all the events of a month.' do
    my_cal = Calendar.new
    my_cal.add_event('meeting1', '11:20 AM in office', '30:11:2020')
    my_cal.add_event('meeting2', '12:20 AM in home', '20:11:2020')
    my_cal.add_event('meeting3', '10:20 AM in school', '10:11:2020')
    result = my_cal.get_description_of_events_of_month(11)
    expect(result[0]).to eq('11:20 AM in office')
  end
end
