menu = open('21.dat').read.lines.map do |line|
  line.gsub(/[,\(\)]/, '').split(' contains ').map(&:split)
end

allergens = menu.flat_map(&:last).uniq
contains_allergen = allergens.map do |allergen|
  [allergen, menu.select { |f, a| a.include?(allergen) }.map(&:first).reduce(:&)]
end

def part2(contains_allergen, known = {})
  return known if contains_allergen.empty?

  known = known.merge(contains_allergen.select { |_, x| x.count == 1 }.to_h { |k, v| [k, v.first] })

  contains_allergen = contains_allergen.map do |f, a|
    next if known.has_key?(f)

    [f, a - known.values]
  end.compact

  part2(contains_allergen, known)
end

p (menu.flat_map(&:first) - contains_allergen.flat_map(&:last)).count
puts part2(contains_allergen).sort_by(&:first).map(&:last).join(',')
