import React from 'react';
import Appointment from './Appointment';

const Provider = props => {
  let url = `/providers/${props.id}`;
  let handleClick = () => {
    props.handleClick(props.id);
  };

  let showEditLink;
  let edit_path = `/providers/${props.id}/edit`;
  if(props.currentUserId === props.id && props.currentUserName === props.name) {
    showEditLink = <a href={edit_path}>Edit My Profile</a>;
  }

  // let appointments = props.appointments.map(appointment => {
  //   return(
  //     <Appointment
  //     key = {appointment.id}
  //     id = {appointment.id}
  //     provider_id = {appointment.provider_id}
  //     user_id = {appointment.user_id}
  //     date = {appointment.date}
  //     start_time = {appointment.start_time}
  //     end_time = {appointment.end_time}
  //     />
  //   );
  // });


  let showDetails;
  let appointmentsPath = `/providers/${props.id}`;
  if(props.selectedProviderId === props.id) {
    showDetails = <div>
      <p>{props.email}</p>
      <p>{props.work_address}</p>
      <p>{props.city}</p>
      <p>{props.state}</p>
      <p>{props.zip}</p>
      <p>{props.bio}</p>
      <h5><a href={appointmentsPath}>See More</a></h5>
      <p>{showEditLink}</p>
    </div>;
  }

  return(
    <div>
      <h3 onClick={handleClick}>{props.name}</h3>
      {showDetails}
    </div>
  );
};

export default Provider;
