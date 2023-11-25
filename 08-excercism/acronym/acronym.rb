class Acronym
  private

  HYPENS = /-/
  NOT_CHARS = /[^a-zA-Z]/

  attr_reader :jargon

  def initialize(prhase)
    @jargon = prhase.gsub(HYPENS, ' ').split.map { |word| word[0].gsub(NOT_CHARS, '').upcase }.join
  end

  public

  def to_s
    @jargon
  end

  def self.abbreviate(prhase)
    new(prhase).to_s
  end
end
