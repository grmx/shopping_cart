$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "shopping_cart/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "shopping_cart"
  s.version     = ShoppingCart::VERSION
  s.authors     = ["Max Grechko"]
  s.email       = ["max@grechko.org"]
  s.homepage    = "https://github.com/gremax/shopping_cart"
  s.summary     = "ShoppingCart Rails Engine"
  s.description = "Shoppin Cart for Rails Application"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 4.2.4"
  s.add_dependency "aasm"
  s.add_dependency "haml-rails"
  s.add_dependency "wicked"
  s.add_dependency "countries"
  s.add_dependency "country_select"
  s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "pry-rails"
  s.add_development_dependency "better_errors"
  s.add_development_dependency "awesome_print"
  s.add_development_dependency "shoulda-matchers"
  s.add_development_dependency "faker"
  s.add_development_dependency "database_cleaner"
  s.add_development_dependency "devise"
  s.add_development_dependency "haml-rails"
  s.add_development_dependency "jquery-rails"
  s.add_development_dependency "codeclimate-test-reporter"
end
