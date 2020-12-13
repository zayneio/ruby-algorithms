# Find Duplicates
# Challenge: given an array, return a list of values that appear more than once

# Using select + count:
def duplicates_1(array)
  array
    .select { |item| array.count(item) > 1 }
    .uniq
end
# Test it:
p duplicates_1([1,1,2,3,4,4,5,6,7,8,8])
# => [1, 4, 8]


# Using find all + count:
def duplicates_2(array)
  array
    .find_all { |item| array.count(item) > 1 }
    .uniq
end
# Test it:
p duplicates_2([1,1,2,3,4,4,5,6,7,8,8])
# => [1, 4, 8]


# Using each_with_object + select:
def duplicates_4(array)
  array
    .each_with_object(Hash.new(0)) { |item, obj| obj[item] += 1 }
    .select { |k, v| v > 1 }
    .keys
end
# Test it:
p duplicates_4([1,1,2,3,4,4,5,6,7,8,8])
# => [1, 4, 8]


# Using each_with_object + reject:
def duplicates_3(array)
  array
    .each_with_object(Hash.new(0)) { |item, obj| obj[item] += 1 }
    .reject { |k, v| v == 1 }
    .keys
end
# Test it:
p duplicates_3([1,1,2,3,4,4,5,6,7,8,8])
# => [1, 4, 8]


# Using group_by + select:
def duplicates_5(array)
  array
    .group_by { |x| x }
    .select { |k, v| v.size > 1 }
    .keys
end
# Test it:
p duplicates_5([1,1,2,3,4,4,5,6,7,8,8])
# => [1, 4, 8]


# Using group_by + reject:
def duplicates_6(array)
  array
    .group_by { |x| x }
    .reject { |k, v| v.size == 1 }
    .keys
end
# Test it:
p duplicates_6([1,1,2,3,4,4,5,6,7,8,8])
# => [1, 4, 8]


# Using sort + reject + with_index:
def duplicates_7(array)
  array
    .sort
    .reject
    .with_index { |_, index| array[index] != array[index + 1] }
    .uniq
end
# Test it:
p duplicates_7([1,1,2,3,4,4,5,6,7,8,8])
# => [1, 4, 8]


# Using delete if
def duplicates_8(array)
  array
    .delete_if { |item| array.count(item) === 1 }
    .uniq
end
# Test it:
p duplicates_8([1,1,2,3,4,4,5,6,7,8,8])
# => [1, 4, 8]