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

  let showDetails;
  if(props.selectedProviderId === props.id) {
    showDetails = <div>
      <p>{props.email}</p>
      <p>{props.work_address}</p>
      <p>{props.city}</p>
      <p>{props.state}</p>
      <p>{props.zip}</p>
      <p>{props.bio}</p>
      <h5>Appointments</h5>
      <p>{props.appointments}</p>
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
