import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import App from './components/App';
import Calendar from './components/Calendar'

$(function() {
  if (document.getElementById('calendar')){
    ReactDOM.render(
      <Calendar />,
      document.getElementById('calendar')
    );
  }
});

$(function() {
  if (document.getElementById('providers')){
    ReactDOM.render(
      <App />,
      document.getElementById('providers')
    );
  }
});
