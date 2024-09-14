# @param {Integer[]} citations
# @return {Integer}

def h_index(citations)
  return 1 if citations.size == 1 && citations.first > 0
  return 0 if citations.size == 1 && citations.first == 0

  h = 0
  citations.sort!.reverse!.each_with_index do |citation, i|
    if citation >= (i + 1)
      h = i + 1
    else
      break
    end
  end
  h
end

p h_index([3, 0, 6, 1, 5])
