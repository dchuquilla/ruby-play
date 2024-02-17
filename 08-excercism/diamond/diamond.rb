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

  attr_reader :to_s, :depth

  private

  ASCII_A = 64
  private_constant :ASCII_A

  def initialize(letter)
    @to_s = ""
    diamond_row = 1
    @depth = depth_number(letter)

    @to_s = lines.each_with_object('') do |vertical_point, line|
      line << generate_line(vertical_point)
    end
  end

  # use lines and columns sequences to generate each line
  # conver current row numbers to letter and fill in the line with spaces
  # e.g. row 1 to A, row 2 to B, row 3 to C
  def generate_line(vertical_point)
    columns.each_with_object('') do |horizontal_point, line|
      line << ' ' and next unless horizontal_point == vertical_point
      line << index_letter(horizontal_point)
    end.eol!
  end

  def depth_number(letter)
    letter.upcase.ord - ASCII_A
  end

  def index_letter(number)
    (number + ASCII_A).chr
  end

  # generate sequence of count down and count up
  # e.g. 3 => [3, 2, 1, 2, 3]
  def columns
    @_columns ||= (@depth.downto(1) + 2.upto(@depth)).to_enum
  end

  # generate sequence of count up and count down
  # e.g. 3 => [1, 2, 3, 2, 1]
  def lines
    @_lines ||= (1.upto(@depth) + (@depth - 1).downto(1)).to_enum
  end
end
