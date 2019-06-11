# Zendesk Intenship Coding Challenge - Ticket Viewer

This is an application built with Ruby on Rails that accesses the Zendesk Api and displays all tickets that are available based on the account details and credentials provided.


## Mission Statement

This is my attempt at a solution for the Zendesk Internship Coding Challenge. 
I decided to use Ruby on Rails as it is the framework that I'm most familair with. I also thought that Rails is primed for taking the least amount of steps to get the app up and running for assessment. 
I also removed the database that generally comes with a Rails App to make it more lightweight and true to the requirements. 
My decision to use Rails over Sinatra was to enhance user experience through ease of setup. Also I love Rails.

## Installing Requirements

Rails requires Ruby version 2.2.2 or later. If the version number returned when typing `$ ruby -v` in the terminal is less than that number, you'll need to install a fresh copy of Ruby.

Anything higher than Rails version 5 should suffice.

Here are some steps to get this app up and running if you haven't already got these things installed:

### Install Ruby

```
$ brew install ruby
```

### Install Rails

```
$ gem install rails
```

If you come come across any issues here are some very comprehensive links to help:

#### Ruby

 - [Ruby](https://www.ruby-lang.org/en/documentation/installation/)
 
#### Rails
 - [Rails Guides](https://guides.rubyonrails.org/getting_started.html)




## App Installation

This process will download a copy of the project to run on your local machine.

### Clone repository

```
$ git clone git@github.com:donatoivan/zendesk-internship-coding-challenge.git
```

### Change into directory

```
$ cd zendesk-internship-coding-challenge
```

### Run bundle install

```
$ bundle
```

### Run Rails server

```
$ rails s
```
### Navigate to localhost in your browser

```
http://localhost:3000
```

**Note: You may have a different localhost port number. If so check your terminal after running Rails server.**
**Look out for "Listening on tcp://localhost:myportnumber"**


## Build Process

### Dependencies

```
gem 'httparty'
gem 'webmock'
gem 'rspec-rails', '~> 3.8'
```

Apart from all the gems you get from Rails by default, I wanted to minimise the amount of gems that I used in my app.
I used HTTParty to access the Zendesk Api and retrieve the tickets.
I used WebMock to simulate the get request to the Zendesk Api in my Rspec test.
And I used Rspec for testing.

### Software Design
I removed the database from my application in an attempt to make the app more lightweight. I had to recreate my rails app with the command `rails new zendesk-internship-coding-challenge -O`. This effectively skips ActiveRecord when creating a new application. As I had initially created my app with a database I had to redo it using this command.

I also wanted to simulate the app being in production as much as possible without having to deploy to something like Heroku. I felt that pushing to production was a bit of an overkill and would make it more difficult to change the Api account details if the tester needed to. With this in mind I altered a few things in the development environment.

I've configured the development environment in Rails to render custom 404 and 500 pages when there are respective errors related to the App that are not specific to the Api(those are separate). I found a workaround that would treat the app as if it were in production which I was really proud of.

```
*config/application.rb*

**config.exceptions_app = self.routes**

- Adding this line tells Rails to serve error pages from the Rails app itself rather than using static error pages in public/.

```
```
*config/environments/development.rb*

**config.consider_all_requests_local = false**

- Setting this option to false tells Rails to show error pages, rather than the stack traces it normally shows in development mode

```

**Note: Even though these custom error pages are rendered instead of the stack trace, rest assured that if you do come across some unforseen circumstances, you have your server in the terminal to provide you with any issue feedback **



* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
