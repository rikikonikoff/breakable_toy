import React, { Component } from 'react';
import ProvidersContainer from './ProvidersContainer';

class App extends Component {
  constructor(props){
    super(props);
    this.state = {

    };
  }

  render(){
    let providersContainer = <ProvidersContainer />;
    
    return(
      <div>
      {providersContainer}
      </div>
    );
  }
}

export default App;
