=begin
Write your code for the 'Acronym' exercise in this file. Make the tests in
`acronym_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/acronym` directory.
=end

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
