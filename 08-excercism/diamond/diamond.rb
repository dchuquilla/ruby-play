class Diamond

  def self.make_diamond(letter)
    new(letter).to_s
  end

  ASCII_A = 64

  attr_reader :to_s

  private

  def initialize(letter)
    @to_s = ''
    index = letter_index(letter)
    line = 1
    sequence = index.downto(1).to_a + 2.upto(index).to_a
    sequence.size.times do |i|
      @to_s += sequence.map { |j| j == line ? index_letter(j) : ' '}.join('') + "\n"
      i >= (index - 1) ? line -= 1 : line += 1
    end
  end

  def letter_index(letter)
    letter.upcase.ord - ASCII_A
  end

  def index_letter(index)
    (index + ASCII_A).chr
  end
end
