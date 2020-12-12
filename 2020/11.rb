# Only part 2; part is in J
layout = open('11.dat').read.lines.map { |l| l.chomp.split('') }

def add(a, b)
  a.zip(b).map(&:sum)
end

def multiply(a, b)
  a.map { |x| x * b }
end

def count(a, x)
  a.select { |y| y == x }.count
end

def visible_seat(state, position, direction)
  1.upto(100) do |i|
    x, y = add(position, multiply(direction, i))

    return '.' if x < 0 || y < 0

    tile = state[x][y]

    return tile if tile != '.'
  end
rescue
  '.'
end

def visible(state, position)
  [[-1, -1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 0], [1, 1]].map do |direction|
    visible_seat(state, position, direction)
  end
end

def step(state)
  state.map.with_index do |row, i|
    row.map.with_index do |tile, j|
      visible = visible(state, [i, j])

      if tile == 'L' && count(visible, '#') == 0
        '#'
      elsif tile == '#' && count(visible, '#') >= 5
        'L'
      else
        tile
      end
    end
  end
end

old_state = layout
new_state = step(old_state)

while old_state != new_state
  old_state = new_state
  new_state = step(old_state)
end

p new_state.sum { |row| count(row, '#') }
