# Designed to be an intentionally inefficient algorithm.
# Bogo Sort will keep running until the numbers are randomly shuffled into the correct order.
#
# @param data [Array]
# @return [Array] the sorted array
def is_sorted(data)
  [*0..(data.size-1)].each do |i|
    return data if data[i + 1].nil?
    return false if data[i] > data[i + 1]
  end
end

# @param data [Array]
def bogo_sort(data)
  until is_sorted(data)
    data.shuffle!; puts "data: #{data}"
  end

  data
end

array = [*1..9].shuffle
p bogo_sort(array)
