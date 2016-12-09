require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

# run console with gem loaded
task :console do
  exec "irb -r natero -I ./lib"
end