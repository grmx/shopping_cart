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

  s.add_development_dependency "sqlite3"
end
