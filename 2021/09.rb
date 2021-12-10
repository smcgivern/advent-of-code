# Only part 2; part is in J
layout = open('09.dat').read.lines.map { |l| l.chomp.split('').map { |c| c.to_i < 9 } }

def visible(state, px, py)
  return 0 unless state[px][py]

  state[px][py] = false

  total = 1

  [[-1, 0], [0, -1], [0, 1], [1, 0]].each do |(dx, dy)|
    x = px + dx
    y = py + dy

    next if x < 0 || y < 0
    next if x > state.length.pred || y > state[x].length.pred

    total += visible(state, x, y)
  end

  total
end

pools = []

0.upto(layout.length.pred) do |i|
  0.upto(layout[i].length.pred) do |j|
    v = visible(layout, i, j)

    pools << v if v.nonzero?
  end
end

p pools.sort.reverse.take(3).reduce(:*)
