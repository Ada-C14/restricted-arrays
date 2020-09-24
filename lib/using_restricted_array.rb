# frozen_string_literal: true

require_relative 'restricted_array.rb'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil
# Time complexity: ?
# Space complexity: ?
def length(array)
  # array[index]
  i = 0
  i += 1 until array[i].nil?

  return i
  # raise NotImplementedError
end

# Prints each integer values in the array
# Time complexity: ?
# Space complexity: ?
def print_array(array)
  # raise NotImplementedError
  i = 0
  until array[i].nil?
    print array[i]
    i += 1
  end
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: ?
# Space complexity: ?
def search(array, _length, value_to_find)
    # raise NotImplementedError
    i = 0
    until array[i] == nil
      if array[i] == value_to_find
        return true
      end
      i += 1
    end
    return false
  end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
# Time complexity: ?
# Space complexity: ?
def find_largest(array, _length)
  # raise NotImplementedError
  i = 0
  largest = array[i]
  until array[i] == nil
      if array[i] > largest
        largest = array[i]
      end
    i = i + 1
  end
  return largest
end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
# Time complexity: ?
# Space complexity: ?
def find_smallest(array, _length)
  # raise NotImplementedError
  i = 0
  smallest = array[i]
  until array[i] == nil
    if array[i] < smallest
      smallest = array[i]
    end
    i = i + 1
  end
  return smallest

end

# Reverses the values in the integer array in place
# Time complexity: ?
# Space complexity: ?
def reverse(array, length)
  i = 0
  max = length - 1
  temp = 0
  until i > max
    temp = array[i]
    array[i] = array[max]
    array[max] = temp
    i = i + 1
    max = max - 1
  end
  return array
end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: ?
# Space complexity: ?
def binary_search(array, length, value_to_find)
  #raise NotImplementedError
  i = 0
  until array[i] == nil
    if array[i] == value_to_find
      return true
    else
      return false
    end
  end
  #
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
    temp_index = index + 1 # compare with values at index+1 to length-1
    while temp_index < length # inner loop - n-1 elements
      min_index = temp_index if array[temp_index] < array[min_index] # found a new minimum, update min_index
      temp_index += 1 # move to next index
    end
    next unless min_index != index # next minimum value is not at current index, swap

    temp = array[min_index]
    array[min_index] = array[index]
    array[index] = temp
  end
end
## --- END OF METHODS ---
