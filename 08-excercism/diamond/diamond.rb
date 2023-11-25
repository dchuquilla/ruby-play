class Diamond
  private

  CHAR_INDEX = 64

  attr_reader :diamond_out

  def initialize(letter)
    @diamond_out = ''
    index = letter_index(letter)
    line = 1
    sequence = index.downto(1).to_a + 2.upto(index).to_a
    sequence.size.times do |i|
      @diamond_out += sequence.map { |j| j == line ? index_letter(j) : ' '}.join('') + "\n"
      i >= (index - 1) ? line -= 1 : line += 1
    end
  end

  def letter_index(letter)
    letter.upcase.ord - CHAR_INDEX
  end

  def index_letter(index)
    (index + CHAR_INDEX).chr
  end

  public

  def to_s
    @diamond_out
  end

  def self.make_diamond(letter)
    new(letter).to_s
  end
end
