# Challenge: given a number, format it to be a balanced, comma separated string.
#
# Example: number_formatter(1234567) => '1,234,567'
#
def number_formatter(num)
  array = num.to_s.split('')
  sets = array.each_slice(3).to_a

  count = 1

  # working backwards from the last set in our array, 
  # pop items from the left array and prepend to the right array until 
  # the right most array is balanced. Then move left one and repeat the process.
  loop do
    right = sets[sets.length - count]
    left = sets[sets.length - (count + 1)]
    
    # break if we've made it all the way to the first array set.
    break if count == sets.size
    # skip to next and increase the counter if the active set (right) is balanced (size = 3)
    next count += 1 if right.size == 3

    right.prepend(left.pop)
  end

  sets.map { |n| n.join('') }
      .join(',')
end
