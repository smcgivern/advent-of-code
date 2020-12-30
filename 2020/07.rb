# Only part 2; part 1 is in J
def parse_bags(filename)
  open(filename).read.lines.to_h do |line|
    a, b = line.split('contain')
    parent = a.match(/(.*?) bags?/)[1]

    if b.include?('no other bags')
      [parent, []]
    else
      [
        parent,
        b.split(',').map do |segment|
          m = segment.match(/(\d+) (.*?) bags?/)

          [m[2], m[1].to_i]
        end
      ]
    end
  end
end

def count(bags, colour)
  bags[colour].sum do |child, n|
    n + n * count(bags, child)
  end || 0
end

p count(parse_bags('07.dat'), 'shiny gold')
