task :travis do
  ["rake db:migrate", "rake test"].each do |cmd|
    puts "Starting to run #{cmd}..."
    system("export DISPLAY=:99.0 && bundle exec #{cmd}")
    raise "#{cmd} failed!" unless $?.exitstatus == 0
  end
  puts "Thank you for Travis-CI!"
end