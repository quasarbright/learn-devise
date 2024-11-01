# learn-devise

A little blog website I made to learn devise, which is an authentication library for Ruby on Rails.

Made with Ruby on Rails.

Users can create, view, edit, and delete articles.
Only an article's creator can edit or delete it.

## Dependencies

* ruby 3.3.5
* sqlite3 3.43.2
* rails 7.2.1.1

## Setup

```shell
bundle install
bin/rails db:migrate
```

## Run Locally

```shell
bin/rails server
```