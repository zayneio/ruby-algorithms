def partition(arr, low, high)
  i = low - 1
  pivot = arr[high]

  for j in low..high do
    if arr[j] < pivot
      i += 1
      arr[i], arr[j] = arr[j], arr[i] 
    end
  end

  i += 1

  arr[i], arr[high] = arr[high], arr[i] 

  i
end

def quick_sort(arr, low, high)
  if low < high
    p_index = partition(arr, low, high) 

    quick_sort(arr, low, p_index - 1) 
    quick_sort(arr, p_index + 1, high) 
  end

  arr
end

# Run it:
arr = [78, 88, 9, 11, 88, 69, 77, 59, 20, 60]
n = arr.size
p quick_sort(arr, 0, n - 1) 