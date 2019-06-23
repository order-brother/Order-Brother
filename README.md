Order Brother!
===
Life is short, we'd like to enjoy every moment of every day.

Here we're trying to offer a way to live a more productive life, 
just don't waste your time to wait in line.

**Order Brother** is a pre-order system that helps people easily find and make orders, or open stores.

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

### Build your own store
> backend store route：/admin/stores
- **登入後**可以建立商店  
  After login, user can build store at `/admin/stores` page, with store name, main image, etc..

- 只能編輯、刪除自己的店面  
Users can ONLY update or delete their own store(s).

### Create dishes

- 只能在自己的店面上架、編輯產品  
Once your store be created, you can add merchendise easily in your store page.
