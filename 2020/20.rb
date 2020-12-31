# Only part 2; part 1 is in J
class Tile
  attr_accessor :cells

  def self.from_raw(raw)
    new(raw.lines[1..-1].map { |x| x.chomp.split('') })
  end

  def initialize(cells)
    @cells = cells
  end

  # right, bottom, left, top
  def edges
    @edges ||= [
      [:itself, :last, :itself],
      [:last, :itself, :reverse],
      [:itself, :first, :reverse],
      [:first, :itself, :itself]
    ].map do |a, b, c|
      cells.send(a).map(&b).send(c)
    end
  end

  def body
    @body ||= cells[1..-2].map { |x| x[1..-2] }
  end

  def edges_with_flip
    @edges_with_flip ||= edges + edges.map(&:reverse)
  end

  def to_s
    cells.map { |x| x.join('') }.join("\n")
  end

  def transform(direction, index)
    a, b, c, d, e = {
      rl: [
        [:reverse, :reverse, :itself, :itself, :itself],
        [:transpose, :reverse, :itself, :itself, :itself],
        [:itself, :itself, :itself, :itself, :itself],
        [:transpose, :itself, :reverse, :itself, :itself],
        [:itself, :itself, :itself, :reverse, :itself],
        [:transpose, :itself, :reverse, :reverse, :itself],
        [:reverse, :reverse, :itself, :reverse, :itself],
        [:transpose, :reverse, :itself, :reverse, :itself],
      ],
      ud: [
        [:transpose, :itself, :reverse, :itself, :itself],
        [:reverse, :reverse, :itself, :itself, :itself],
        [:transpose, :reverse, :itself, :itself, :itself],
        [:itself, :itself, :itself, :itself, :itself],
        [:transpose, :reverse, :itself, :itself, :reverse],
        [:itself, :itself, :itself, :itself, :reverse],
        [:transpose, :itself, :reverse, :itself, :reverse],
        [:reverse, :reverse, :itself, :itself, :reverse],
      ]
    }[direction][index]

    self.class.new(cells.send(a).map(&b).send(c).map(&d).send(e))
  end
end

def stitch(tile, tiles, direction: :rl)
  case direction
  when :rl
    edge = tile.edges[0].reverse
    right = tiles.find { |x| x.edges_with_flip.include?(edge) }

    [right, direction, right.edges_with_flip.index(edge)]
  when :ud
    edge = tile.edges[1].reverse
    bottom = tiles.find { |x| x.edges_with_flip.include?(edge) }

    [bottom, direction, bottom.edges_with_flip.index(edge)]
  end
end

def join_row(row)
  Tile.new(row.map(&:body).reduce { |a, b| a.map.with_index { |r, i| r + b[i] } })
end

MONSTER = Regexp.new(<<EOS.gsub(' ', '.').chomp)
^                  # $
^#    ##    ##    ###$
^ #  #  #  #  #  #   $
EOS

def part2
  tiles = open('20.dat').read.split("\n\n").map { |x| Tile.from_raw(x) }
  edge_counts = tiles.flat_map(&:edges_with_flip).group_by(&:itself).to_h { |k, v| [k, v.count] }

  left_edge = tiles.find { |x| x.edges.map { |y| edge_counts[y] } == [2, 2, 1, 1] }
  current = left_edge
  tiles -= [current]
  row = [current]
  rows = []

  12.times do |i|
    11.times do
      current, direction, index = stitch(current, tiles, direction: :rl)
      tiles -= [current]
      current = current.transform(direction, index)
      row << current
    end

    rows << row

    next if i == 11

    current, direction, index = stitch(left_edge, tiles, direction: :ud)
    tiles -= [current]
    current = left_edge = current.transform(direction, index)
    row = [current]
  end

  big = Tile.new(rows.map { |x| join_row(x).cells }.reduce(&:+))

  big.to_s.count('#') - 0.upto(7).sum do |i|
    0.upto(76).sum do |j|
      0.upto(93).sum do |k|
        Tile.new(big.transform(:rl, i).cells.map { |x| x[j..j+19] }[k..k+2]).to_s.match(MONSTER)&.length.to_i * 15
      end
    end
  end
end

puts part2
