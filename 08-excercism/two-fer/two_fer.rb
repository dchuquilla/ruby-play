=begin
Write your code for the 'Two Fer' exercise in this file. Make the tests in
`two_fer_test.rb` pass.
=end

module TwoFer
  def self.two_fer(name = 'you')
    %{One for #{name}, one for me.}
  end
end
