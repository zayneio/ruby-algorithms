# Implement: Merge Sort
#
# Defines the mid point length of the array and then splits it into 2 halfs (L & R)
# Recursively calls merge_sort on each half
#
# @param array [Array] an unsorted array of numbers
# @param return [Array] a sorted array of numbers
def merge_sort(array)
  return array if array.size <= 1
   
  mid = array.size / 2
  left = array[0..mid - 1]
  right = array[mid..array.size - 1]

  merge(merge_sort(left), merge_sort(right))
end

# While there are values in the left or right array,
# push the first element of the left array if it is greater than
# the first element of the right array. Otherwise, push the first
# element of the right array. Then concat everything together.
#
# @param left [Array] the left array
# @param right [Array] the right array
# @param return [Array]
def merge(left, right)
  array = []

  until left.empty? || right.empty?
    next array.push(left.shift) if left.first <= right.first

    array.push(right.shift)
  end

  array.concat(left).concat(right)
end

array = [*1..10].shuffle
p merge_sort(array)
# => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

array = [*'a'..'z'].shuffle
p merge_sort(array)
# => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

