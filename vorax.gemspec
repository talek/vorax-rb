Gem::Specification.new do |gem|

  gem.name          = "vorax"
  gem.version       = "5.1"
  gem.authors       = ["Alexandru Tica"]
  gem.email         = ["alexandru.tica@gmail.com"]
  gem.description   = %q{Provides the logic required by Vorax, an Oracle IDE for geeks. Even the main goal of this gem is to support Vorax, it can also be used as it is to interact with a hidden SqlPLUS process or to parse SQL/PLSQL code.}
  gem.summary       = %q{Vorax ruby code companion.}
  gem.homepage      = "https://github.com/talek/vorax-rb"

  gem.files         = `git ls-files`.split($/)

  gem.add_runtime_dependency "nokogiri"
  gem.add_runtime_dependency "childprocess"
  gem.add_runtime_dependency "rubytree"
  gem.add_runtime_dependency "ferret"

end
