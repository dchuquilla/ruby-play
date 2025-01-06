=begin
Write your code for the 'Pangram' exercise in this file. Make the tests in
`pangram_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/pangram` directory.
=end

class Pangram
  def self.pangram?(sentence)
    # My solution (0.59)
    alphabet = ('a'..'z').to_a
    sentence.downcase.chars.each do |char|
      alphabet.delete(char) if alphabet.include?(char)
      break if alphabet.empty?
    end

    alphabet.empty?

    # Connor's solution (0.58)
    # ('a'..'z').all? { |e| sentence.downcase.include?(e) }

    # dmunoz-10's solution (0.57)
    # sentence.downcase.scan(/[a-z]/).uniq.size == 26
  end

end
