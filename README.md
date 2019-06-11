# Zendesk Intenship Coding Challenge - Ticket Viewer

This is an application built with Ruby on Rails that accesses the Zendesk Api and displays all tickets that are available based on the account details and credentials provided.


## Mission Statement

This is my attempt at a solution for the Zendesk Internship Coding Challenge. 
I decided to use Ruby on Rails as it is the framework that I'm most familair with. It also, in my opinion, takes the least amount of steps to setup for the assessor. 
I also removed the database that generally comes with a Rails App to make it more lightweight and true to the requirements. 
My decision to use Rails over Sinatra was again to enhance user experience through ease of setup. Also I love Rails.

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

**Note: You may have a different localhost port number. If so check your terminal after running Rails server.**\
**Look out for "Listening on tcp://localhost:myportnumber"**



## Usage

The app itself is pretty simple. You are presented with a home page that has a clickable link that sends you through to a list of all the tickets, which you can paginate through. Each individual ticket also has its own button that sends you to a separate page which displays all the relevant information for that specific ticket.

There are custom 404 and 500 pages for any errors related to the app.

There is also an error page that renders if there is any issue with the Zendesk Api.


## Build Process

### Dependencies

```
gem 'httparty'
gem 'webmock'
gem 'rspec-rails', '~> 3.8'
```

Condsidering all the gems you get with Rails by default, I wanted to minimise the amount of gems that I added to my app.\
I used HTTParty to access the Zendesk Api and retrieve the tickets.\
I used WebMock to simulate the get request to the Zendesk Api in my Rspec test.\
And I used Rspec for testing.

### Software Design

I removed the database from my application in an attempt to make the app more lightweight. I had to recreate my rails app with the command `rails new zendesk-internship-coding-challenge -O`. This effectively skips ActiveRecord when creating a new application. As I had initially created my app with a database I had to redo it using this command.

I also wanted to simulate the feel of the app being in production as much as possible without having to deploy to something like Heroku. I felt that pushing to production was a bit of an overkill and would make it more difficult to change the Api account details if the tester needed to. With this in mind I altered a few things in the development environment.

I've configured the development environment in Rails to render custom 404 and 500 pages when there are respective errors related to the App that are not specific to the Api(those are separate). I found a workaround that would simulate the app being in production which I was really happy with.


> config/application.rb
```
config.exceptions_app = self.routes

- Adding this line tells Rails to serve error pages from the Rails app itself rather than using static error pages in public.

```

> config/environments/development.rb
```
config.consider_all_requests_local = false

- Setting this option to false tells Rails to show error pages, rather than the stack traces it normally shows in development mode

```

**Note: Even though these custom error pages are rendered instead of the stack trace, rest assured that if you do come across some unforseen circumstances, you have your terminal to provide you with any fatal error feedback**

### Testing

Oof. Firstly, I want to say that I've never done any testing before with Rspec, let alone any other testing tool. I also want to add that it may just be me, but as a career changer who is newish to the industry, I feel that the Rspec documentation on the internet is really lacking and obtuse at the best of times. There's a really steep learning curve associated with it. Even so, I figured that this was a wonderful opportunity to challenge myself to learn some very important concepts and notions. I also now feel compelled to learn more about Rspec and testing in general, especially to understand it better and hopefully pass on my knowledge to other career changers in the future(there's going to be a lot of them).

Anyway, thankfully I was able to put together a test suite for the assessment.

I initially used Rspec to test the actual Zendesk Api, but after some reading on the internet, I came across a school of thought that believed that tests should be able to run in isolation without depending on any third party Api.

```
Requests to external services during test runs can cause several issues:

- Tests failing intermittently due to connectivity issues.
- Dramatically slower test suites.
- Hitting API rate limits on 3rd party sites (e.g. Twitter).
- Service may not exist yet (only documentation for it).
- Service doesn’t have a sandbox or staging server.
```

With this in mind, I used WebMock to simulate Api calls in conjunction with Rspec.
There are also tests for the custom error pages in the `spec/features` folder.


### Run Tests

In the app directory, run:
```
$ rails spec
```

## Epilogue

I had a lot of fun making this application, learned some cool things along the way and found out that I want to learn more about testing and Rspec.

Cheers.

## Author

Ivan Donato
