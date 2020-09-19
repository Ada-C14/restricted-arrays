require_relative 'restricted_array.rb'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil
# Time complexity: O(n) in Big O terms, where n is the number of elements in the array.
# Space complexity: constant or O(1) since the additional storage needed,
# does not depend on input array size.

def length(array)
  count = 0
  until array[count] == nil
    count += 1
  end
  return count
end

# Prints each integer values in the array
# Time complexity: O(n) in Big O terms, where n is the number
# of elements in the array.
# Space complexity: constant or O(1) since the additional storage needed,
# does not depend on input array size.
def print_array(array)
  count = 0
  until array[count] == nil
    print array[count]
    print ' '
    count += 1
  end
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: O(n), where n is the number of elements in the array.
# Space complexity: constant or O(1) since the additional storage needed,
# does not depend on input array size.
def search(array, length, value_to_find)
  count = 0
  while count < length
    return true if array[count] == value_to_find
    count += 1
  end
  return false
end


# Finds and returns the largest integer value in the array
# Assumes that the array is not sorted.
# Time complexity: O(n), where n is the number of elements in the array.
# Space complexity: constant or O(1) since the additional storage needed,
# does not depend on input array size.
def find_largest(array, length)
  largest_value = 0 #first value of array is 1
  count = 0
  while count < length
    largest_value = array[count] if array[count] > largest_value
    count += 1
  end
  return largest_value
end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
# Time complexity: O(n), where n is the number of elements in the array.
# Space complexity: constant or O(1) since the additional storage needed,
# does not depend on input array size.
def find_smallest(array, length)
  smallest_value = 250 #largest value of array is 221
  count = 0
  while count < length
    smallest_value = array[count] if array[count] < smallest_value
    count += 1
  end
  return smallest_value
end

# Reverses the values in the integer array in place
# Time complexity: O(n), where n is the number of elements in the array.
# Space complexity: constant or O(1) since the additional storage needed,
# does not depend on input array size. (Reverses in place, doesn't
# store new array of size n.)

def reverse(array, length)
  count = 0
  while count < length / 2
    array[length - count - 1] = array[count] + array[length - count - 1]
    array[count] = array[length - count - 1] - array[count]
    array[length - count - 1] = array[length - count - 1] - array[count]
    count += 1
  end
  return array
end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: O(log(n)), where n is the number of elements in the array.
# This is a binary search.
# Space complexity: constant or O(1) since the additional storage needed,
# does not depend on input array size.
def binary_search(array, length, value_to_find)
  low = 0
  high = length - 1
  mid = (low + high) / 2

  if array[low] == value_to_find || array[high] == value_to_find
    return true
  else

    while low < high
      if array[mid] == value_to_find
        return true
      elsif array[mid] > value_to_find
        high = mid - 1
      elsif array[mid] < value_to_find
        low = mid + 1
      end
      mid = (high + low) / 2
    end

    return false
  end
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
