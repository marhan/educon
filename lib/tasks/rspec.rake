require 'rspec/core/rake_task'

namespace :spec do
  desc "Run the code examples in spec/requests (not included in rake spec)"
  RSpec::Core::RakeTask.new(:scene) do |t|
    t.pattern = "spec/requests/**/*_scene_spec.rb"
  end
  RSpec::Core::RakeTask.new(:all) do |t|
    t.pattern = "spec/**/*_spec.rb"
  end
end

desc 'runs request scenes'
task :scene => %w(spec:scene)

desc 'runs all tests'
task :test => %w(spec:all)