class LogLineParser
  DISPLAY = '%<message>s (%<level>s)'
  REGULAR_EXPRESSION = {
    words: /\w+/,
    letters: /\w/,
    level_colon_message_format: /\A\[(\w+)\]:\s*(.*?)\s*\z/m
  }
  RE = REGULAR_EXPRESSION
  private_constant :RE, :REGULAR_EXPRESSION

  private

  def initialize(line, format = DISPLAY)
    line       = line.scan(RE[:level_colon_message_format]).flatten
    @message   = line.last
    @log_level = line.first.downcase
    @reformat  = format % {message: message, level: log_level}
  end

  public

  attr_reader :message,
              :log_level,
              :reformat
end