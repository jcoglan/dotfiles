require 'fileutils'

task :default => :install

task :install do
  files = Dir.entries('.') - %w[. .. .git Rakefile tags]
  files.each do |file|
    dest = File.join(ENV['HOME'], '.' + file)
    FileUtils.rm_rf dest
    puts "cp -r #{file} #{dest}"
    FileUtils.cp_r file, dest
  end
end

