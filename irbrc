# Tab completion
require 'irb/completion'
IRB.conf[:USE_READLINE] = true

# Set default prompt
IRB.conf[:PROMPT_MODE] = :SIMPLE

%w[rubygems active_support active_record].each do |lib|
  begin
    require lib
  rescue LoadError
    puts "WARNING: could not load '#{lib}'"
  end
end

module ActiveRecordHelper
  def sqlite!
    ActiveRecord::Base.establish_connection(
      :adapter  => "sqlite3",
      :database => ":memory:")
  end

  def model(name, &block)
    sqlite!
    ActiveRecord::Schema.define do
      create_table(name.to_s.tableize, :force => true) do |t|
        t.timestamps
        block.call(t)
      end
    end
    Object.const_set(name, Class.new(ActiveRecord::Base))
  end
end

extend ActiveRecordHelper

