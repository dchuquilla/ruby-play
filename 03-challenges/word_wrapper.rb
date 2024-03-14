# Word Wrapper
#
# Your task is to break a one-line text into lines with a maximum 40 characters per line.
# Important: No words can be broken.
#
input = "In 1991, while studying computer science at University of Helsinki, Linus Torvalds began a project that later became the Linux kernel. He wrote the program specifically for the hardware he was using and independent of an operating system because he wanted to use the functions of his new PC with an 80386 processor. Development was done on MINIX using the GNU C Compiler."

output =
"""In 1991, while studying computer science
at University of Helsinki, Linus
Torvalds began a project that later
became the Linux kernel. He wrote the
program specifically for the hardware he
was using and independent of an
operating system because he wanted to
use the functions of his new PC with an
80386 processor. Development was done on
MINIX using the GNU C Compiler."""

def solution(text)
  #.text.scan(/\b.{1,40}\b/).map { |l| l.strip }.join("\n")
  text.split(/\s/).each_with_object(['']) do |word, acum|
      if(acum.last.length + word.length + 1) > 40
          acum << word
      else
          acum.last << ' ' unless acum.last.empty?
          acum.last << word
      end
  end
end

puts solution(input)
