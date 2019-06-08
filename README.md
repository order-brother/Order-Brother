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

Start Rails server.

```
$ rails s
```

## Check routes:

Check rails routes for more detail:

```
$ rails routes
```

|Pages|Prefix|URI Pattern|
|:---|:---|:---|
|Backstage Page:| rails_admin | `/backstage` |
|User sign up:| new_user_registration | `/users/sign_up(.:format)` |
|User sing in:| new_user_session | `/users/sign_in(.:format)` |

## Membership System
- Using phone number as sign up account, but user can sign in with either phone number(10 digits) or email.
