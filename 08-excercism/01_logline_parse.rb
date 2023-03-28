# frozen_string_literal: true

# In this exercise you'll be processing log-lines.
#
# Each log line is a string formatted as follows: "[<LEVEL>]: <MESSAGE>".
#
# There are three different log levels:
#
# INFO
# WARNING
# ERROR
# You have three tasks, each of which will take a log line and ask you to do something with it.
# There are lots of ways to solve these tasks - choose your favourite methods from the examples
# above and see what you can come up with.
class LogLineParser
  DISPLAY = '%<message>s (%<level>s)'
  REGULAR_EXPRESSION = {
    words: /\w+/,
    letters: /\w/,
    level_colon_message_format: /\A\[(\w+)\]:\s*(.*?)\s*\z/m
  }.freeze
  RE = REGULAR_EXPRESSION
  private_constant :RE, :REGULAR_EXPRESSION

  private

  def initialize(line, format = DISPLAY)
    line       = line.scan(RE[:level_colon_message_format]).flatten
    @message   = line.last
    @log_level = line.first.downcase
    @reformat  = format(format, message: message, level: log_level)
  end

  public

  attr_reader :message, :log_level, :reformat
end
