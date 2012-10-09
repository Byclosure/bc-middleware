# -*- encoding: utf-8 -*-
require File.expand_path('../lib/bc-middleware/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Byclosure"]
  gem.email         = ["info@byclosure.com"]
  gem.description   = %q{Library to get a middleware implementation (REST api), with support a search, etc. fast}
  gem.summary       = %q{Library to get a middleware implementation (REST api), with support a search, etc. fast}
  gem.homepage      = "http://github.com/Byclosure/bc-middleware"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "bc-middleware"
  gem.require_paths = ["lib"]
  gem.version       = Bc::Middleware::VERSION

  gem.add_dependency("inherited_resources", "~> 1.3.1")
end


