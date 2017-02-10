import React from 'react';

const Search = props => {
  return(
    <div className="form-group">
      <input type="text" id="reactsearch" className="form-control" placeholder="Search providers by name, insurance provider, city, or zip code" onChange={props.handleSearch}></input>
    </div>
  );
};

export default Search;
