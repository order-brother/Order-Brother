Order Brother!
===

## Requirements

* Ruby version 2.6.0
* Rails version 5.2.3
* PostgreSQL 11.3

## Usage

### Install Dependency

```
$ bundle install
```

### Prepare Database

If you didn't have database.

```
$ rake db:create
```

And run migration to create tables.

```
$ rake db:migrate
```

### Rails

Start Rails server

```
$ rails s
```

## Check routes:

```
$ rails routes
```
- Backstage Page: rails_admin `/backstage`
- User sign up  : new_user_registration `/users/sign_up(.:format)`
- User sing in  : new_user_session `/users/sign_in(.:format)`
