# Donations API

The objective of this project is the implementation of some endpoints to manage donations. With this development I want to show some of my skills as a software engineer.

For the implementation I used Ruby on Rails configured only as an API.

The API consists of the following endpoints:
- GET /donations
- POST /donations
- PUT /donations/:id
- DELETE /donations/:id

### Prerequisites

- Ruby 3.1.4
- Bundler 2.4.13
- PostgreSQL 14

### Check out the repository

```bash
$ git clone https://github.com/anmacagno/donations-api.git
```

### Install the dependencies

```bash
$ bundle install
```

### Setup the database

```bash
$ rails db:setup
```

Important: postgres will use the default role. This is the same name as the operating system user that initialized the database.

### Run the test suite

```bash
$ rails rspec
```

### Run the linter

```bash
$ rails rubocop
```

### Run the server

```bash
$ rails server
```

### Test an endpoint

If you are testing in the local environment the base url for the endpoints is http://localhost:3000/api/v1.

```bash
$ curl --location 'http://localhost:3000/api/v1/donations' \
--header 'Content-Type: application/json' \
--data-raw '{
    "donation": {
        "email": "john.doe@example.com",
        "amount": 100,
        "currency": "usd",
        "credit_card": {
            "name": "John Doe",
            "number": "1111222233334444",
            "expiration": "12/2023",
            "cvv": "123"
        }
    }
}'
```

### Mailer preview

With the following link you can see a preview of the mails that the application sends.

http://localhost:3000/rails/mailers/notifications

### Added gems

These are the gems that I added to the project (development and test):

- factory_bot_rails
- rspec-rails
- rubocop
- rubocop-factory_bot
- rubocop-performance
- rubocop-rails
- rubocop-rake
- rubocop-rspec
- shoulda-matchers
- simplecov
- database_consistency
- letter_opener

Also, to render JSON as response from the endpoints, I use the [jbuilder](https://github.com/rails/jbuilder) gem.

### Project structure overview

Where to start? Look at the file **app/controllers/api/v1/donations_controller.rb**.

Don't forget to look at the tests in the **spec** folder.
