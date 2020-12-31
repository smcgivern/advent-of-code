player_1, player_2 = open('22.dat').read.split("\n\n").map { |x| x.lines[1..-1].map(&:to_i) }

def part1(player_1, player_2)
  return player_1 if player_2.empty?
  return player_2 if player_1.empty?

  a = player_1.shift
  b = player_2.shift

  a > b ? part1(player_1 + [a, b], player_2) : part1(player_1, player_2 + [b, a])
end

def part2(player_1, player_2)
  seen = {}
  winner = nil

  while player_1.any? && player_2.any?
    if seen[[player_1, player_2]]
      winner = :p1
      break
    end

    seen[[player_1.dup, player_2.dup]] = true

    a = player_1.shift
    b = player_2.shift
    player_1_wins = a > b

    if player_1.count >= a && player_2.count >= b
      player_1_wins = part2(player_1.take(a), player_2.take(b)).first == :p1
    end

    player_1_wins ? player_1.concat([a, b]) : player_2.concat([b, a])
  end

  if winner == :p1 || player_2.empty?
    [:p1, player_1]
  else
    [:p2, player_2]
  end
end

def score(result)
  result.zip(result.length.downto(1).to_a).sum { |x, y| x * y }
end

p score(part1(player_1.dup, player_2.dup))
p score(part2(player_1.dup, player_2.dup).last)
