# Challenge: given an array and number (n), return an array that only contains every nth item

# using each_slice + map
def nth_items_1(array, n)
  array.each_slice(n).map(&:last)
end
# Test it:
p nth_items_1([*1..100], 11)
# [11, 22, 33, 44, 55, 66, 77, 88, 99, 100]


# using select + with_index
def nth_items_2(array, n)
  array.select.with_index { |_, i| (i + 1) % n == 0 }
end
# Test it:
p nth_items_2([*1..100], 11)
# [11, 22, 33, 44, 55, 66, 77, 88, 99]
