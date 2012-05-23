# Tab completion
require 'irb/completion'
IRB.conf[:USE_READLINE] = true

# Set default prompt
IRB.conf[:PROMPT_MODE] = :SIMPLE

require 'rubygems'
require 'bundler/setup' if File.file?('Gemfile')
