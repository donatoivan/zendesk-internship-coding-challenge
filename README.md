# Zendesk Intenship Coding Challenge - Ticket Viewer

This is an application built with Ruby on Rails that accesses the Zendesk Api and display all tickets that are available.


## Mission Statement

This is my attempt at a solution for Zendesk Internship Coding Challenge. 
I decided to use Ruby on Rails as it is the framework that I'm most familair with. I also thought that it would be a framework that would require the least amount of steps to get the project up and going for assessment. I also removed the database to make rails more lightweight and true to the requirements. My decision to use Rails over Sinatra was due to user experience with regards to setup. Also I love Rails.

## Assumptions

I am assuming that the person testing this will have `Ruby` and `Rails` already installed.

If not, here are some steps you can do to get this up amd running:

### Install Ruby

```
$ brew install ruby
```

### Install Rails

```
$ gem install rails
```

If you come come across any issues these are some very comprehensive links to help you setup:

#### Ruby

 - [Ruby](https://www.ruby-lang.org/en/documentation/installation/)
 
#### Rails
 - [Rails Guides](https://guides.rubyonrails.org/getting_started.html)




## Installation

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
I used webmock to simulate get request in my Rspec test.
And I used Rspec for testing.

I removed the database from my application in an attempt to make the app more lightweight. I had to recreate my rails app with the command `rails new zendesk-internship-coding-challenge -O`. This effectively skips ActiveRecord when creating a new application. As I had initially created my app with a database I had to redo it using this command. 


* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
