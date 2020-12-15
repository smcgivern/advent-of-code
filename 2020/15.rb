# Only part 1; part is in J
def game(initial, to)
  indices = {}
  last = initial.last

  initial.each.with_index do |n, i|
    indices[n] = i.succ
  end

  initial.length.upto(to.pred) do |i|
    l = indices[last]
    indices[last] = i
    last = l ? i - l : 0
  end

  last
end

p game([9, 6, 0, 10, 18, 2, 1], 30000000)
