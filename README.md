# Order Brother!

Life is short, we'd like to enjoy every moment of every day.

Here we're trying to offer a way to live a more productive life,
just don't waste your time to wait in line.

[**Order Brother**](#Order-Brother!) is a pre-order platform that helps people easily search foods, make orders, or open stores.

> Order brother, help you out like your older brother.

## Table of content

[Requirements](#Requirements)  
[Usage](#Usage)  
  - [Install Dependency](#Install-Dependency)  
  - [Prepare Database](#Prepare-Database)
  - [Start server](#Start-server)
  - [Check routes](#Check-routes)

[Membership System](#Membership-System)  
  - [Pop-up button](#Pop-up-menu)
  - [Build your own store](#Build-your-own-store)
  - [Create dishes](#Create-dishes)
  - [Manage orders if you are owner](#Manage-orders-if-you-are-owner)
  - [Make order if you are hunger](#Make-order-if-you-are-hunger)

## Requirements

- Ruby version 2.6.0
- Rails version 5.2.3
- PostgreSQL 11.3

## Usage

### Install Dependency

```s
$ bundle install
```

### Prepare Database

If you didn't have database.

```s
$ rails db:create
```

And run migration to create tables.

```s
$ rails db:migrate
```

### Start server

Start Rails server.

```s
$ rails s
```

### Check routes:

Check rails routes for more detail:

```
$ rails routes
```

| Pages           | Prefix                | URI Pattern                |
| :-------------- | :-------------------- | :------------------------- |
| Backstage Page: | rails_admin           | `/backstage`               |
| User sign up:   | new_user_registration | `/users/sign_up(.:format)` |
| User sing in:   | new_user_session      | `/users/sign_in(.:format)` |


## Membership System

### Pop-up menu

Open pop-up menu by the icon on top right side, the sign-up button is right inside.

- Using phone number as sign up account, but user can sign in with either phone number(10 digits) or email.

### Build your own store

> backend store route：/admin/stores

<!-- - **登入後**可以建立商店   -->
  After login, user can build store at `/admin/stores` page, with store name, main image, etc..

<!-- - 只能編輯、刪除自己的店面   -->
  Users can ONLY update or delete their own store(s).

### Create dishes

<!-- - 只能在自己的店面上架、編輯產品   -->
  Once your store be created, you can add merchendise easily in your store page.

### Manage orders if you are owner

The list button below store information section let you manage orders which belongs to the current store, you can change state of orders in list page.

### Make order if you are hunger

You can easily find stores, click into one of the store pages, choose your time preference to pick up and select dishes you want, the shopping cart section on the right side will shows current amount price immediatily.

> Check orders you made anytime from [Pop-up menu](#Pop-up-menu)

## Entity-Relation Model

![Entity-relation Model](https://order-brother.s3-ap-northeast-1.amazonaws.com/Entity-relation+model.png)

## The order state machine

Orders' state can only change by the flow that defined in Transaction model, you could redefine the state you want in `app/models/transaction.rb`, here's the sample of transaction flow:
![Transaction flow](https://order-brother.s3-ap-northeast-1.amazonaws.com/order_flow.png)