# ShoppingCart

[![Build Status](https://travis-ci.org/gremax/shopping_cart.svg?branch=master)](https://travis-ci.org/gremax/shopping_cart) [![Code Climate](https://codeclimate.com/github/gremax/shopping_cart/badges/gpa.svg)](https://codeclimate.com/github/gremax/shopping_cart) [![Test Coverage](https://codeclimate.com/github/gremax/shopping_cart/badges/coverage.svg)](https://codeclimate.com/github/gremax/shopping_cart/coverage)

This is a simple Ruby on Rails plugin based on Rails Engine.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'shopping_cart', git: 'git://github.com/gremax/shopping_cart'
```

And then execute:

    $ bundle

Edit your `app/controller/application_controller.rb` and add a current_user method, unless you are using the Devise gem.

## Usage

### Initialization

Mount the shopping_cart engine in your `config/routes.rb`:

```ruby
mount ShoppingCart::Engine, at: '/shopping_cart'
```

Create database structure:

```ruby
rake shopping_cart:install:migrations
rake db:migrate
```

Add to your User model:

```ruby
class User < ActiveRecord::Base
  ...
  acts_as_customer
end
```

Add to your product models:

```ruby
class Book < ActiveRecord::Base
  ...
  acts_as_product
end
```

```ruby
class Pen < ActiveRecord::Base
  ...
  acts_as_product
end
```

Also you need to fill delivery types:

```ruby
ShoppingCart::Delivery.create!([
  {
    name: 'UPS Ground',
    price: 5.00
  },
  {
    name: 'UPS Two Day',
    price: 10.00
  },
  {
    name: 'UPS One Day',
    price: 15.00
}])
```

For notification messages add to `app/views/layout/application.html.erb`:

```ruby
<%= notice %>
```

### Helpers

Add a book to the cart:

```ruby
= button_to 'Add to cart', shopping_cart.order_items_path(book_id: book)
```

Add a pen to the cart:

```ruby
= button_to 'Add to cart', shopping_cart.order_items_path(pen_id: pen)
```

Add a link to the cart:

```ruby
= link_to 'Cart', shopping_cart.cart_path
```

Add a link to the orders history:

```ruby
= link_to 'Orders', shopping_cart.orders_path
```

### Views

You can generate views for customization to `app/views/shopping_cart`:

    $ rails generate shopping_cart:views


## Tests

    $ bundle exec rspec

## Contributing

1. Fork it ( https://github.com/gremax/shopping_cart/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
