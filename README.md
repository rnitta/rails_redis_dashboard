# rails_redis_dashboard

Simple Redis dashboard for Rails. This is intended to add-on to a rails applications.
**If you(r environments) can use middleware, you may well use another rich redis dashboard product such as
redis-commander.**  
Differentiates from another rails redis dashboard gems are:

- this gem does not require
    - Sprockets
    - Persistent data (e.g. Database)

## Installation

Add this line to your application's Gemfile:

```ruby
gem "rails_redis_dashboard", git: 'https://github.com/rnitta/rails_redis_dashboard'
```

And then execute:

```bash
$ bundle i
```

## Usage

In config/initializers/redis.rb or somewhere,

```ruby
RailsRedisDashboard.configure do |config|
  config.redis_current = Redis.current
end
```

In routes.rb,

```ruby
mount RailsRedisDashboard::Engine, at: "/redis"
```

if you want to require authentication, and with devise,

```ruby
authenticated :user do
  mount RailsRedisDashboard::Engine, at: "/redis"
end
```

or with sorcery,

```ruby

class UserConstraint
  def matches?(request)
    return false unless request.session['user_id']
    user = User.find_by(id: request.session['user_id'])
    user.present? # any conditions
  end
end
```

and

```ruby
require "rails_redis_dashboard/engine"

mount RailsRedisDashboard::Engine, at: "/redis", constraints: UserConstraint.new
```

↓↓ NOT IMPLEMENTED YET ↓↓

if you want to customize views:

```bash
$ rails g rails_redis_dashboard:views:install
```

Then views will be generated in `app/views/rails_redis_dashboard/**/*.{html.erb,css}`
Customize it.

## Requirements

- Rails
- Redis

## using cdn

this uses bootstrap via cdn

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
