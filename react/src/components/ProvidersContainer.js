/* eslint no-console: off */

import React, { Component } from 'react';
import Provider from './Provider';

class ProvidersContainer extends Component {
  constructor(props){
    super(props);
    this.state = {
      providers: [],
      selectedProviderId: null,
      currentUserId: null,
      currentUserName: null
    };
    this.fetchData = this.fetchData.bind(this);
    this.fetchCurrentUser = this.fetchCurrentUser.bind(this);
    this.handleClick = this.handleClick.bind(this);
  }

  componentDidMount(){
    this.fetchData();
    this.fetchCurrentUser();
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
    .catch(error => console.error(`Error in providers fetch: ${error.message}`));
  }

  fetchCurrentUser() {
    fetch('/api/v1/providers/1', {
      credentials: 'same-origin'
    })
    .then(response => {
      if(response.ok) {
        return response.json();
      } else {
        let errorMessage = `${response.status}, (${response.statusText})`;
        let error = new Error(errorMessage);
        throw(error);
      }
    })
    .then(data => {
      this.setState({ currentUserId: data[0]["id"], currentUserName: data[0]["name"] });
    })
    .catch(error => console.error(`Error in current user fetch: ${error.message}`));
  }

  handleClick(id) {
    if (id === this.state.selectedProviderId) {
      this.setState({ selectedProviderId: null });
    } else {
      this.setState({ selectedProviderId: id });
    }
  }

  render(){
    let searchTerm;
    if (this.props.searchTerm !== ""){
      searchTerm = this.props.searchTerm;
    }
    
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
        appointments = {provider.appointments}
        currentUserId = {this.state.currentUserId}
        currentUserName = {this.state.currentUserName}
        handleClick = {this.handleClick}
        selectedProviderId = {this.state.selectedProviderId}
        />
      );
    });

    return(
      <div>{providers}</div>
    );
  }
}

export default ProvidersContainer;
