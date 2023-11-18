module Diamond
  class << self
    private
    INDEX = 64
    attr_accessor :letter, :heigth

    def letter_index(letter)
      letter.upcase.ord - INDEX
    end

    def index_letter(index)
      (index + INDEX).chr
    end

    public
    def make_diamond(letter)
      diamond = ''
      idx = letter_index(letter)
      line = 1
      secuence = idx.downto(1).to_a + 2.upto(idx).to_a
      secuence.size.times.each do |i|
        diamond += secuence.map { |j| j == line ? index_letter(j) : ' '}.join('') + "\n"
        if i >= (idx - 1)
          line -= 1
        else
          line += 1
        end
      end
      diamond
    end
  end
end
