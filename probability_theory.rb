# Challenge: Given an array of items, calculate the probability that an item from the array could be randomly selected.
def probability(array)
  (1.0 / array.length).to_f
end

puts probability([*1..4]) # => 0.25 (25%)
puts probability(['heads', 'tails']) # => 0.5 (50%)
puts probability([*1..6]) # => 0.1666 (16.66%)


# Challenge: Write a method that uses the probability (see above) to randomly select an item from the input array
# Hint: Check out probability theory, random variables, and discrete random variables
# This may be helpful: https://revisionmaths.com/advanced-level-maths-revision/statistics/discrete-random-variables
def random_chance(array)
  randomness, probability = rand, probability(array)

  array.each_with_index do |item, index|
    chance = (probability + (probability * index)).to_f

    return item if randomness <= chance
  end
end

10.times do
  # Rolling a 6 sided die
  p random_chance([*1..6])
end

10.times do
  # Flipping a coin
  p random_chance(['heads', 'tails'])
end

# Explanation, given an array of options, we calculate the probability which will be a number between 0 and 1,
# and we calculate a random chance which will be a number between 0 and 1.
# Then we loop through each option and check whether the random percentage chance is less than or equal to a given slice.
# If so, return that option.
  # Ex: random_chance([*1..4]). The probability is 25% (1/4 = 0.25). We generate a random number, let's say we get 0.7.
  # So, in the above method, we will check if 0.7 <= 0.25, if so we'll return 1. It's not, so we move to the next item in our array and
  # and check if 0.7 <= 0.5, and if it is return 2. It's not so we move to the next item and check if our randomness is <= .75.
  # it is, so we return 3 that time.
#
  # Ex: random_chance(['Heads', 'Tails']). The probability is 50% (1/2 = 0.5). We generate a random number, let's say we get 0.33.
  # we loop through our array and check if our random number (0.33) is <= 0.5. It is, so we return heads.