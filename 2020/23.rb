def move(cups, max, current)
  cup_1 = cups[current]
  cup_2 = cups[cup_1]
  cup_3 = cups[cup_2]
  succ = cups[cup_3]

  destination = current.pred

  while [0, cup_1, cup_2, cup_3].include?(destination)
    if destination <= 0
      destination = max
    else
      destination -= 1
    end
  end

  cups[current] = succ
  cups[cup_3] = cups[destination]
  cups[destination] = cup_1

  succ
end

def play(seed, size, steps)
  init = seed.split('').map(&:to_i)
  cups = [nil] +
    init.zip(init.rotate).sort_by(&:first).map(&:last)[0..-2] +
    seed.length.succ.upto(size).to_a +
    [init.first]
  current = init.first

  steps.times { current = move(cups, size, current) }

  cups
end

def part1
  result = play('712643589', 9, 100)
  current = 1
  output = ''

  loop do
    current = result[current]

    return output if current == 1

    output += current.to_s
  end
end

def part2
  result = play('712643589', 1000000, 10000000)

  result[1] * result[result[1]]
end

puts part1
puts part2
