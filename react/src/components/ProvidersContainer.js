import React, { Component } from 'react';
import Provider from './Provider';

class ProvidersContainer extends Component {
  constructor(props){
    super(props);
    this.state = {
      providers: []
    };
    this.fetchData = this.fetchData.bind(this);

  }

  componentDidMount(){
    this.fetchData();
    setInterval(this.fetchData, 6000);
  }

  fetchData(){
    fetch('/api/v1/providers')
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
      this.setState({ providers: data });
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render(){
    let providers = this.state.providers.map(provider => {
      return(
        <Provider
        key = {provider.id}
        id = {provider.id}
        name = {provider.name}
        email = {provider.email}
        address = {provider.work_address}
        city = {provider.city}
        state = {provider.state}
        zip = {provider.zip}
        bio = {provider.bio}
        />
      );
    });

    return(
      <div>
      hiya
      {providers}
      </div>
    );
  }
}

export default ProvidersContainer;
