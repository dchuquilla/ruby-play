module StringEolRefinement
  refine String do
    def eol!
      self << "\n"
    end
  end
end

class Diamond
  using StringEolRefinement

  attr_reader :to_s

  def self.make_diamond(letter)
    d = new(letter)
    d.to_s
  end

  private
  ASCII_A = 64
  private_constant :ASCII_A

  def initialize(letter)
    depth = letter.upcase.ord - ASCII_A
    lines = (1.upto(depth) + (depth - 1).downto(1)).to_enum
    @columns = (depth.downto(1) + 2.upto(depth)).to_enum

    @to_s = lines.with_object('') do |vertical_point, line|
      line << generate_line(vertical_point)
    end
  end

  # use lines and columns sequences to generate each line
  # conver current row numbers to letter and fill in the line with spaces
  # e.g. row 1 to A, row 2 to B, row 3 to C
  def generate_line(vertical_point)
    @columns.with_object('') do |horizontal_point, line|
      line << ' ' and next unless horizontal_point == vertical_point
      line << index_letter(horizontal_point)
    end.eol!
  end

  def index_letter(number)
    (number + ASCII_A).chr
  end
end
