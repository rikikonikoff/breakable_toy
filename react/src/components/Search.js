import React from 'react';

const Search = props => {
  return(
    <div id="formStuff" className="small-10 columns">
      <div className="small-6 columns">
        <input type="text" id="search" className="small-12 columns" onChange={props.handleSearch}></input>
      </div>
    </div>
  );
};

export default Search;
