require 'fileutils'

task :install do
  files = Dir.entries('.') - %w[. .. .git Rakefile]
  files.each do |file|
    dest = File.join(ENV['HOME'], '.' + file)
    FileUtils.rm_rf dest
    FileUtils.cp_r file, dest
  end
end

