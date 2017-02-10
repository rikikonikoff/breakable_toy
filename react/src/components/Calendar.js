import React from 'react';

const Calendar = require('react-event-calendar');

const appointments = [];

fetch('/api/v1/appointments')
.then(response => {
  if(response.ok){
    return response.json();
  } else {
    let errorMessage = `${response.status} (${response.statusText})`,
    error = new Error(errorMessage);
    throw(error);
  }
})
.then(data => {
  appointments = data;
})
.catch(error => console.error(`Error in providers fetch: ${error.message}`));

const events = appointments.map(event => {
  return({
    start: event.date,
    end: event.date,
    title: `Appointment with ${event.provider.name}:
      ${event.start_time.toTimeString()} - ${event.end_time.toTimeString()}`,
    description: `Address: ${event.provider.work_address} ${event.provider.city}
      ${event.provider.state} ${event.provider.zip}`,
    data: event
  })
});

const today = new Date();

<Calendar
  month={today.month}
  year={today.year}
  events={events}
  onEventClick={(target, eventData, day) => console.log(eventData)}
  />

export default Calendar;
