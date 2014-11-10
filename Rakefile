require 'fileutils'
require 'find'

task :default => :install

NUKE = '.nuke'
SKIP = %w[.git .gitmodules Rakefile tags]

task :install do
  Find.find('.') do |path|
    Find.prune if SKIP.include?(File.basename(path))
    Find.prune if path =~ /\.swp$/

    target = File.join(ENV['HOME'], '.' + path.gsub(/^\.\//, ''))

    if File.directory?(path) and File.exist?(File.join(path, NUKE))
      FileUtils.rm_rf(target)
      puts "rm -rf #{target}"

      FileUtils.mkdir_p(File.dirname(target))
      FileUtils.cp_r(path, target)
      puts "cp -r #{path} #{target}"

      FileUtils.rm(File.join(target, NUKE))
      Find.prune

    elsif File.file?(path)
      FileUtils.mkdir_p(File.dirname(target))
      FileUtils.cp(path, target)
      puts "cp #{path} #{target}"
    end
  end
end
