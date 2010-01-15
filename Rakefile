require 'fileutils'

task :install do
  files = Dir.entries('.') - %w[. .. .git Rakefile]
  files.each do |file|
    FileUtils.cp file, File.join(ENV['HOME'], '.' + file)
  end
end

