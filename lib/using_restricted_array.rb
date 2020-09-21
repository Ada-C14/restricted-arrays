require_relative 'restricted_array.rb'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil
# Time complexity: O(n) , it will take n (the number of elements in the array) times to go through the array
# Space complexity: O(1) no additional space required, only need O(1) to retrieve the element at index[n]
def length(array)
  index = 0
  until array[index] == nil
    index += 1
  end

  return index
end

# Prints each integer values in the array
# Time complexity: O(n) it will take n (the number of elements in the array) times to go through the array
# Space complexity: O(1) no additional space required, only need O(1) to retrieve the element at index[n]
def print_array(array)
  index = 0
  until array[index] == nil
    print "#{array[index]}"
    index += 1
  end
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: O(n) it will take n (the number of elements in the array) times to go through the array
# Space complexity: O(1) no additional space required, only need O(1) to retrieve the element at index[n]
def search(array, length, value_to_find)
  index = 0
  value_found = false
  while index < length
    if value_to_find == array[index]
      value_found = true
    end
    index += 1
  end
  return value_found
end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
# Time complexity: O(n) it will take n (the number of elements in the array) times to go through the array
# Space complexity: O(1) no additional space required, only need O(1) to retrieve the element at index[n]
def find_largest(array, length)
  index = 0
  max = 0
  while index < length
    if array[index] > max
      max = array[index]
    end
    index += 1
  end
  return max
end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
# Time complexity: O(n) it will take n (the number of elements in the array) times to go through the array
# Space complexity: O(1) no additional space required, only need O(1) to retrieve the element at index[n]
def find_smallest(array, length)
  index = 0
  min = 222
  while index < length
    if array[index] < min
      min = array[index]
    end
    index += 1
  end
  return min
end

# Reverses the values in the integer array in place
# Time complexity: O(n) it will take n (the number of elements in the array) times to go through the array
# Space complexity: O(1) no additional space required, only need O(1) to retrieve the element at index[n]
def reverse(array, length)
  i = 0
  j = length - 1
  while i < j
    temp = array[i]
    array[i] = array[j]
    array[j] = temp
    i = i + 1
    j = j - 1
  end
  return array
end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: O(log n) , since we are sorting the array of n length
# Space complexity: O(1) no additional space required, only need O(1) to retrieve the element at index[n]
def binary_search(array, length, value_to_find)
  low = 0
  high = length - 1
  while low <= high
    mid = (low + high) / 2
    if value_to_find > array[mid]
      low = mid + 1
    elsif value_to_find < array[mid]
      high = mid - 1
    else
      return true
    end
  end
  return false
end

# Helper method provided to sort the array in ascending order
# Implements selection sort
# Time complexity = O(n^2), where n is the number of elements in the array.
# To find the correct value for index 0, a total of (n-1) comparisons are needed.
# To find the correct value for index 1, a total of (n-2) comparisons are needed.
# To find the correct value for index 2, a total of (n-3) comparisons are needed.
# and so on ...
# To find the correct value for index (n-2), a total of 1 comparisons is needed.
# To find the correct value for the last index, a total of 0 comparisons are needed.
# Total number of comparisons = (n-1) + (n-2) + ... 3 + 2 + 1
#                             = (n * (n-1))/2
# This is O(n^2) in Big O terms.
# Space complexity = constant or O(1) since the additional storage needed,
# does not depend on input array size.
def sort(array, length)
  length.times do |index| # outer loop - n elements
    min_index = index # assume index is where the next minimally value is
    temp_index = index+1 # compare with values at index+1 to length-1
    while temp_index < length # inner loop - n-1 elements
      if array[temp_index] < array[min_index] # found a new minimum, update min_index
        min_index = temp_index
      end
      temp_index += 1 # move to next index
    end
    if min_index != index # next minimum value is not at current index, swap
      temp = array[min_index]
      array[min_index] = array[index]
      array[index] = temp
    end
  end
end
## --- END OF METHODS ---
