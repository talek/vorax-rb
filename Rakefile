require_relative 'spec/spec_helper.rb'
require 'rspec/core/rake_task'
require 'yard'

desc 'Default: run specs.'
task :default => :spec

desc "Run specs"
RSpec::Core::RakeTask.new

desc "Generate documentation"
YARD::Rake::YardocTask.new

desc 'Builds the gem'
task :build do
  sh "gem build vorax.gemspec"
end

desc 'Builds and installs the gem'
task :install => :build do
  sh "gem install vorax-#{Vorax::VERSION} --no-rdoc --no-ri"
end

desc 'Tags version, pushes to remote, and pushes gem'
task :release => :build do
  sh "git tag v#{Vorax::VERSION}"
  sh "git push origin master"
  sh "git push origin v#{Vorax::VERSION}"
  sh "gem push vorax-#{Vorax::VERSION}.gem"
end
