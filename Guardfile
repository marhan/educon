guard :rspec, :version => 2 do
  # app folders
  watch(%r{^app/controllers(.+)\.*$}) { "spec/controllers" }
  watch(%r{^app/helpers(.+)\.*$}) { "spec/helpers" }
  watch(%r{^app/models(.+)\.*$}) { "spec/models" }
  watch(%r{^app/config(.+)\.*$}) { "spec" }
  # spec folders
  watch(%r{^spec/.+_spec\.rb$})
  watch('spec/spec_helper.rb') { "spec" }
  watch(%r{^spec/support/(.+)\.rb$}) { "spec" }
end

guard :bundler do
  watch('Gemfile')
end

guard :migrate do
  watch(%r{^db/migrate/(\d+).+\.rb})
end

