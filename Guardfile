guard :rspec, :version => 2, :all_after_pass => true do
  # app folders
  watch(%r{^app/(.+)\.*}) { "spec" }
  # spec folders
  watch(%r{^spec/(.+)\.*}) { "spec" }
  # vendor
  watch(%r{^vendor/(.+)\.*}) { "spec" }
end

guard :bundler do
  watch('Gemfile')
end

#guard :migrate do
#  watch(%r{^db/migrate/(\d+).+\.rb})
#end

