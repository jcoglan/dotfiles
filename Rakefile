require 'fileutils'
require 'find'

task :default => :install

KEEP = '.keep'

task :install do
  files = Dir.entries('.') - %w[. .. .git Rakefile tags]
  files.each do |file|
    path = File.expand_path(file, File.dirname(__FILE__))
    dest = File.join(ENV['HOME'], '.' + file)
    if File.directory?(path) and File.file?(File.join(path, KEEP))
      Find.find(file) do |subpath|
        next if File.basename(subpath) == KEEP
        next unless File.file?(subpath)
        dest = File.join(ENV['HOME'], '.' + subpath)
        FileUtils.mkdir_p(File.dirname(subpath))
        FileUtils.cp(subpath, dest)
      end
    else
      FileUtils.rm_rf dest
      FileUtils.cp_r file, dest
    end
  end
end

