Gem::Specification.new do |gem|                                                                                                                                                                                    

  gem.name          = "vorax"
  gem.version       = "5.3.1"
  gem.authors       = ["Alexandru Tica"]
  gem.email         = ["alexandru.tica@gmail.com"]
  gem.licenses      = ["MIT"]
  gem.description   = %q{This is just a helper gem for VoraX, an Oracle IDE for geeks. It just defines the other gems VoraX is depending on, as a convenient method to install all the required gems in one step.}
  gem.summary       = %q{Dummy dependencies package for Vorax.}
  gem.homepage      = "https://github.com/talek/vorax-rb"

  gem.files         = `git ls-files`.split($/)

  gem.add_runtime_dependency "nokogiri", '~> 1.8'
  gem.add_runtime_dependency "childprocess", '~> 0.7'
  gem.add_runtime_dependency "rubytree", '~> 0.9'
  gem.add_runtime_dependency "ferret", '~> 0.11'

end

