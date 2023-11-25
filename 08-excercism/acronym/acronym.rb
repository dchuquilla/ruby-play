class Acronym
  private

  NOT_CHARS = /\b[a-zA-Z]/

  attr_reader :jargon

  def initialize(phrase)
    @jargon = phrase.scan(NOT_CHARS).join.upcase
  end

  public

  def to_s
    @jargon
  end

  def self.abbreviate(phrase)
    new(phrase).to_s
  end
end
