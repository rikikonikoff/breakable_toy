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
    .then(providers => {
      this.setState({ providers: providers });
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
    let searchTerm = this.props.searchTerm.toLowerCase();

    let fitsSearchTerm = (provider) => {
      let insurersArray = provider.insurers.map(insurer => {
        return(`${insurer.company.toLowerCase()} ${insurer.plan.toLowerCase()}`)
      })
      let insurers = insurersArray.toString();
      if (searchTerm === "") {
        return true;
      } else {
        return provider.name.toLowerCase().includes(searchTerm)
        || provider.zip && provider.zip === searchTerm
        || provider.city && provider.city.toLowerCase().includes(searchTerm)
        || insurers.includes(searchTerm);
      }
    };

    let searchedProviders = this.state.providers.filter(fitsSearchTerm);

    let providers = searchedProviders.map(provider => {
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
        insurers = {provider.insurers}
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
