require 'rubygems'
require 'active_support'

# cf. http://www.ruby-forum.com/topic/99818 and http://www.ruby-forum.com/topic/84414

# Tab completion
require 'irb/completion'
IRB.conf[:USE_READLINE] = true

# Set default prompt
IRB.conf[:PROMPT_MODE] = :SIMPLE
