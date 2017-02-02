import React, { Component } from 'react';
import Search from './Search';
import ProvidersContainer from './ProvidersContainer';

class App extends Component {
  constructor(props){
    super(props);
    this.state = {
      searchTerm: ""
    };
    this.handleSearch = this.handleSearch.bind(this);
  }

  handleSearch(event) {
    event.preventDefault();
    this.setState({ searchTerm: event.target.value });
  }

  render(){
    let search = <Search
                  handleSearch = {this.handleSearch}
                 />;

    let providersContainer = <ProvidersContainer
                              searchTerm = {this.state.searchTerm}
                             />;
    return(
      <div className="container-fluid">
        <div className="row">
          <h1 className="col-sm-4">Providers</h1>
        </div>
        <div className="row">
          <div className="col-sm-4">{search}</div>
        </div>
        <div>{providersContainer}</div>
      </div>
    );
  }
}

export default App;
