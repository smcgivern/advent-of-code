require 'set'

map = open('12.dat').read.lines.map { |l| l.chomp.split('-') }.reduce({}) do |hash, (a, b)|
  hash[a] ||= Set.new
  hash[b] ||= Set.new
  hash[a] << b
  hash[b] << a
  hash
end

def lowercase?(s); s == s.downcase; end

def traverse(map, loc, route, double_visit: nil)
  route << loc

  return route.join(',') if loc == 'end'

  options = map[loc].reject do |nxt|
    lowercase?(nxt) && route.select { |x| x == nxt }.length == (double_visit == nxt ? 2 : 1)
  end

  return unless options.any?

  options.flat_map { |nxt| traverse(map, nxt, route.dup, double_visit: double_visit) }.compact.uniq
end

p traverse(map, 'start', []).length # Part 1
p map.
  keys.
  select { |x| lowercase?(x) && x != 'start' && x != 'end' }.
  flat_map { |double_visit| traverse(map, 'start', [], double_visit: double_visit) }.
  uniq.
  length # Part 2
