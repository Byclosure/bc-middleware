# -*- encoding: utf-8 -*-
require File.expand_path('../lib/bc-middleware/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Byclosure"]
  gem.email         = ["info@byclosure.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "bc-middleware"
  gem.require_paths = ["lib"]
  gem.version       = Bc::Middleware::VERSION

  gem.add_dependency("inherited_resources", "~> 1.3.1")
end


