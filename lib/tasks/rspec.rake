require 'rspec/core/rake_task'

namespace :spec do
  desc "Run the code examples in spec/requests (not included in rake spec)"
  RSpec::Core::RakeTask.new(:scene) do |t|
    t.pattern = "spec/requests/**/*_scene.rb"
  end
  RSpec::Core::RakeTask.new(:unit) do |t|
    t.pattern = "spec/**/*_spec.rb"
  end
end

desc 'runs request scenes'
task :scene => %w(spec:scene)

desc 'runs unit tests'
task :unit => %w(spec:unit)

desc 'runs all tests'
task :test => %w(spec:unit spec:scene)