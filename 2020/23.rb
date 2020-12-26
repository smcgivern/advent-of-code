def move(cups)
  pick_up = cups.slice!(1, 3)
  destination = cups.sort.reverse.slice_after(cups.first).to_a.last.first

  cups.rotate!
  cups.insert(cups.find_index(destination).succ, *pick_up)
end

def part1
  cups = '712643589'.split('').map(&:to_i)

  100.times { move(cups) }

  cups.slice_after(1).to_a.reverse.flatten.join[0..-2]
end

puts part1
