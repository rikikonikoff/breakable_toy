import React from 'react';

const Provider = props => {
  let url = `/providers/${props.id}`;
  let handleClick = () => {
    props.handleClick(props.id);
  };

  let showDetails;
  if(props.selectedProviderId === props.id) {
    showDetails = <div>
      <p>{props.email}</p>
      <p>{props.work_address}</p>
      <p>{props.city}</p>
      <p>{props.state}</p>
      <p>{props.zip}</p>
      <p>{props.bio}</p>
      <p>Appointments</p>
      <p>{props.appointments}</p>
    </div>;
  }

  return(
    <div>
      <callout className="callout">
          <p onClick={handleClick}>{props.name}</p>
            {showDetails}
      </callout><br/>
    </div>
  );
};

export default Provider;
