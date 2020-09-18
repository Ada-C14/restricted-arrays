require_relative 'restricted_array.rb'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil
# Time complexity: O(n)
# Space complexity: ?
def length(array)
  #raise NotImplementedError
  index = 0
  until array[index].nil? # keep incrementing until you reach nil
    index += 1
  end
  return index
end

# Prints each integer values in the array
# Time complexity: O(n)
# Space complexity: ?
def print_array(array)
  #raise NotImplementedError
  i = 0
  until i >= length(array)
    print "#{array[i]} "
    i += 1
  end

end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: O(n)
# Space complexity: ?
def search(array, length, value_to_find)
  #raise NotImplementedError
  i = 0
  while i < length
    return true if value_to_find == array[i]
    i += 1
  end
  return false
end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
# Time complexity: O(n)
# Space complexity: ?
def find_largest(array, length)
  #raise NotImplementedError
  max_element = array[0]
  i = 0
  while i < length
    # if array[i] > max_element
    #   max_element = array[i]
    # end
    max_element = array[i] if array[i] > max_element
    i += 1
  end
  return max_element
end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
# Time complexity: O(n)
# Space complexity: ?
def find_smallest(array, length)
  #raise NotImplementedError
  min_element = array[0]
  i = 0
  while i < length
    min_element = array[i] if array[i] < min_element
    i += 1
  end
  return min_element
end

# Reverses the values in the integer array in place
# Time complexity: O(n)
# Space complexity: ?
def reverse(array, length)
  #raise NotImplementedError
  i = 0
  j = length - 1

  # using a temp variable
  while i < j
    temp = array[i]
    array[i] = array[j]
    array[j] = temp

    i += 1
    j -= 1
  end
  return array
end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: O(log n)
# Space complexity: ?
def binary_search(array, length, value_to_find)
  # raise NotImplementedError
  # why didn't we need to sort the array here?
  sorted_array = sort(array,length)

  return false if length == 0

  low = 0
  high = length - 1 # last element

  while low <= high
    mid = (low + high) / 2 # mid is the index between low and high

    if array[mid] == value_to_find
      return true
    elsif array[mid] > value_to_find
      # value to find is less than the value at the mid index
      #  eliminate the second half
      high = mid - 1
    else
      # array[mid] < value_to_find
      # value to find is greater than the value at the mid index
      # eliminate the first half
      low = mid + 1 # not sure what this means?
    end
  end
  return false # exited the while loop because value isn't found in array
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
