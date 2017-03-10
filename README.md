![Build Status](https://codeship.com/projects/0c4c1b30-c932-0134-e478-6a795a0b4831/status?branch=master)
![Code Climate](https://codeclimate.com/github/rikikonikoff/breakable_toy.png)
![Coverage Status](https://coveralls.io/repos/github/rikikonikoff/breakable_toy/badge.svg?branch=master)

#AccessPoint

This is my capstone project, or "Breakable Toy", for Launch Academy. It is a web application for mental health care appointment scheduling. Providers can post their open appointments, and patients can book these appointments at the click of a button - no phone calls necessary! In this stage, the app is a prototype or "proof of concept", showing that this kind of service could exist and could streamline a process that can be arduous and counterproductive to the health of people seeking care. To that end, I have seeded the database with several fake mental health professionals for the sake of demonstrating how it would work if real providers were to use it.

## Technology
I integrated the following technologies and features into this project:
* Ruby on Rails back end with a PostgreSQL database
* Provider search page using ReactJS for live updates and filter-as-you-type searching
* Google OmniAuth, customized for my unique use case so that a single Google profile can be used to create both a provider and a patient in my database, each with its own unique experience of the app
* Links to Google Maps for all provider addresses, which will automatically show up with users' saved places since they are already signed in with their Google accounts
* Introductory landing page that explains the purpose of the website and how to use it
* A "Resources" page with links to other mental health-related organizations

## Future Development
I have a few ideas for where this project could go next, including:
* Integration of Google Calendars for providers to more easily input their open appointments
* Calendar view of appointments (rather than the current list view), using ReactJS
* Sorting providers and appointments by type (i.e. "Psychiatrist") by adding a Type model and appropriate associations to the database
