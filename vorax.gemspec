Gem::Specification.new do |gem|

  gem.name          = "vorax"
  gem.version       = "5.1"
  gem.authors       = ["Alexandru Tica"]
  gem.email         = ["alexandru.tica@gmail.com"]
  gem.description   = %q{Dummy dependencies package for Vorax.}
  gem.summary       = %q{Dummy dependencies package for Vorax.}
  gem.homepage      = "https://github.com/talek/vorax-rb"

  gem.files         = `git ls-files`.split($/)

  gem.add_runtime_dependency "nokogiri"
  gem.add_runtime_dependency "childprocess"
  gem.add_runtime_dependency "rubytree"
  gem.add_runtime_dependency "ferret"

end
