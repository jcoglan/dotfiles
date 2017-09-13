# Tab completion
require 'irb/completion'
IRB.conf[:USE_READLINE] = true

# Set default prompt
IRB.conf[:PROMPT_MODE] = :SIMPLE

require 'rubygems'

if %w[Gemfile gems.rb].any? { |f| File.file? f }
  require 'bundler/setup'
end
