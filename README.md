IT 123
======

Awesome it resources.

# Information

- Hosted on [Heroku](http://it123.herokuapp.com)
- Powered by [Ruby on Rails](http://rubyonrails.org)

# Installation

```ruby
heroku config:set EMAIL=[...]
heroku run rake db:migrate
heroku run rails console
Admin.create!({ :email => '...', :password => '...', :password_confirmation => '...' })
```
