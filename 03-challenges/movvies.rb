Movie = Struct.new(:name, :category)
movies = [
  %w[Avenger Action],
  %w[Spidermna Action],
  %w[Hangover Comedy]
].collect { |cat, name| Movie.new(name, cat) }
foo = movies.each_with_object({}) do |p, h|
  h[p.category] ||= []
  h[p.category] << p
end

puts foo
