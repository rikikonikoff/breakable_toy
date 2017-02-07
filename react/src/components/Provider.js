import React from 'react';

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

  let showAddress;
  if(props.address !== null) {
    showAddress = <p> {props.address}, {props.city}, {props.state} {props.zip}</p>;
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
    showDetails = <div className="padded">
      <p>{props.email}</p>
      {showAddress}
      <p>{props.bio}</p>
      <a href={appointmentsPath} id="provider-path-link">Go to My Page</a>
      <p> {showEditLink}</p>
      <br/>
    </div>;
  }

  return(
    <div id="providerCard" className="card col-md-4">
      <div className="card-block">
        <h2 className="card-title" onClick={handleClick}>{props.name}</h2>
        {showDetails}
      </div>
    </div>
  );
};

export default Provider;
