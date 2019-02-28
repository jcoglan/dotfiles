# Tab completion
require 'irb/completion'
IRB.conf[:USE_READLINE] = true

# Set default prompt
IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:AUTO_INDENT] = true

require 'rubygems'

if %w[Gemfile gems.rb].any? { |f| File.file? f }
  gem 'bundler'
  require 'bundler/setup'
end
