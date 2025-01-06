=begin
Write your code for the 'Isogram' exercise in this file. Make the tests in
`isogram_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/isogram` directory.
=end
class Isogram
  def self.isogram?(input)
    input.downcase!
    input.gsub!(/[^a-z]/, "")
    # input.split("").uniq.length == input.length
    input.chars.uniq.length == input.length
  end
end
