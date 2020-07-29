# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

## Final Product

* Home page

  !["Home page"](https://github.com/RubinJhand/jungle_rails/blob/master/docs/home_page.png)

* Signed in: Active Sale

  !["Signed in: Active Sale"](https://github.com/RubinJhand/jungle_rails/blob/master/docs/signed_in_with_active_sale.png)

* Empty Cart Message

  !["Empty Cart Message"](https://github.com/RubinJhand/jungle_rails/blob/master/docs/empty_cart.png)

* Product Detail

  !["Product Detail"](https://github.com/RubinJhand/jungle_rails/blob/master/docs/individual_item.png)

* Order Details/Cart View

  !["Order Details"](https://github.com/RubinJhand/jungle_rails/blob/master/docs/cart_view.png)

* Order Complete

  !["Order Complete"](https://github.com/RubinJhand/jungle_rails/blob/master/docs/completed_order.png)

* Admin Options: Categories

  !["Admin Options: Categories"](https://github.com/RubinJhand/jungle_rails/blob/master/docs/admin_categories.png)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a [Stripe](https://stripe.com) account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information (documentation): [Stripe](https://stripe.com/docs/testing#cards)

## Dependencies

- Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
- PostgreSQL 9.x
- Stripe
