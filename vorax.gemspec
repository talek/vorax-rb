# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vorax/version'

Gem::Specification.new do |gem|
  gem.name          = "vorax"
  gem.version       = Ruby::Vorax::VERSION
  gem.authors       = ["Alexandru Tica"]
  gem.email         = ["alexandru.tica@gmail.com"]
  gem.description   = %q{Provides the logic required by Vorax, an Oracle IDE for geeks. Even the main goal of this gem is to support Vorax, it can also be used as it is to interact with a hidden SqlPLUS process or to parse SQL/PLSQL code.}
  gem.summary       = %q{Vorax ruby code companion.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rspec", "~> 2.6"
end
