SCORES = { ')' => 3, ']' => 57, '}' => 1197, '>' => 25137 }
CLOSES = { '(' => ')', '[' => ']', '{' => '}', '<' => '>' }

def incomplete_score(string)
  expected = []

  string.split('').each do |char|
    if CLOSES.has_key?(char)
      expected << CLOSES[char]
    elsif expected.pop != char
      return SCORES[char]
    end
  end

  0
end

def completion_score(string)
  expected = []

  string.split('').each do |char|
    if CLOSES.has_key?(char)
      expected << CLOSES[char]
    elsif expected.pop != char
      return 0
    end
  end

  expected.reverse.reduce(0) do |score, char|
    (score * 5) + CLOSES.values.index(char).succ
  end
end

def median(array)
  array.sort[array.length / 2]
end

input = open('10.dat').read.lines.map(&:chomp)

p input.map(&method(:incomplete_score)).sum
p median(input.map(&method(:completion_score)).reject(&:zero?))

