player_1, player_2 = open('22.dat').read.split("\n\n").map { |x| x.lines[1..-1].map(&:to_i) }

def part1(player_1, player_2)
  return player_1 if player_2.empty?
  return player_2 if player_1.empty?

  a = player_1.shift
  b = player_2.shift

  a > b ? part1(player_1 + [a, b], player_2) : part1(player_1, player_2 + [b, a])
end

def score(result)
  result.zip(result.length.downto(1).to_a).sum { |x, y| x * y }
end

p score(part1(player_1, player_2))
