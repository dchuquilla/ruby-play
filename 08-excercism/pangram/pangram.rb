=begin
Write your code for the 'Pangram' exercise in this file. Make the tests in
`pangram_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/pangram` directory.
=end

class Pangram
  def self.pangram?(sentence)
    alphabet = ('a'..'z').to_a
    sentence.downcase.chars.each do |char|
      alphabet.delete(char) if alphabet.include?(char)
      break if alphabet.empty?
    end

    alphabet.empty?
  end
end
