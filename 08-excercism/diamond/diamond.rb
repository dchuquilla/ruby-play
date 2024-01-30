module StringEolRefinement
  refine String do
    def eol!
      self << "\n"
    end
  end
end

class Diamond
  using StringEolRefinement

  def self.make_diamond(letter)
    new(letter).to_s
  end

  attr_reader :to_s, :sequence, :index

  private

  ASCII_A = 64
  private_constant :ASCII_A

  def initialize(letter)
    @to_s = ""
    diamond_row = 1
    @index = index_number(letter)
    @sequence = generate_sequence

    sequence.size.times do |i|
      @to_s += generate_line(diamond_row)
      # diamond_row will tell which number convert to letter
      i >= (@index - 1) ? diamond_row -= 1 : diamond_row += 1
    end
  end

  # use sequence to generate each line
  # conver current row numbers to letter and fill in the line with spaces
  # e.g. row 1 to A, row 2 to B, row 3 to C
  def generate_line(row)
    @sequence.each_with_object('') { |j, str| str << (j == row ? letter(j) : ' ') }.eol!
  end

  def index_number(letter)
    letter.upcase.ord - ASCII_A
  end

  def letter(number)
    (number + ASCII_A).chr
  end

  # generate sequence of count down and count up
  # e.g. 3 => [3, 2, 1, 2, 3]
  def generate_sequence
    @index.downto(1).to_a + 2.upto(@index).to_a
  end
end
