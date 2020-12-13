# Given a sorted array, find the given value's index in the array using binary search (if it exists)
#
# Approach: set min to 0, max to the last index of the array (array.size - 1)
# While min is less than or equal to max, set the midpoint in the array, and check
# the value at the midpoint. Return the index of the item when a match is found.
# If the midpoint value is less than the value we are looking for, set the new min equal
# to the midpoint + 1, skip to the next iteration and check again. Otherwise if the midpoint
# value is greater than the value we are looking for, set the new max to the previous mid - 1.
#
# @param array [Array] a sorted array of values
# @param value [Int/String] the item we want to find in array
# @return [Integer] the index of the item in the array or nil if it does not exist
def binary_search(array, value)
  min, max = 0, array.size - 1

  while min <= max
    mid = (min + max) / 2

    return mid if (array[mid] === value)

    next min = mid + 1 if array[mid] < value

    max = mid - 1
  end
end

p binary_search([*1..100], 66)
# => 65

p binary_search([*1..50], 66)
# => nil

p binary_search([*'a'..'z'], 'm')
# => 12

p binary_search([*'p'..'z'], 'm')
# => nil
