guard :rspec, :version => 2, :all_after_pass => true do
  # app folders
  watch('app/controllers/application_controller.rb') {"spec/controllers"}
  watch(%r{^app/controllers/(.+)\.rb}) { |m| "spec/controllers/#{m[1]}_spec.rb" }
  watch(%r{^app/helpers/(.+)\.rb}) { |m| "spec/helpers/#{m[1]}_spec.rb" }
  watch(%r{^app/models/(.+)\.rb})  { |m| "spec/models/#{m[1]}_spec.rb" }
  watch(%r{^app/views/(.+)\.*$}) { "spec/requests" }
  watch(%r{^app/config/(.+)\.*$}) { "spec" }
  # spec folders
  watch(%r{^spec/.+_spec\.rb$})
  watch('spec/spec_helper.rb') { "spec" }
  watch(%r{^spec/support/(.+)\.rb$}) { "spec" }
  # request scenes
  watch(%r{^spec/.+_scene_spec\.rb$})
  watch('spec/requests/spec_helper.rb') { "spec/requests" }
  watch(%r{^spec/requests/support/(.+)\.rb$}) { "spec/requests" }
end

guard :bundler do
  watch('Gemfile')
end

#guard :migrate do
#  watch(%r{^db/migrate/(\d+).+\.rb})
#end

