require_relative 'restricted_array.rb'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil
# Time complexity: O(n) because I'm performing a linear search until the loop reaches nil in the array.
# Space complexity: O(1), because I'm only looking for 1 value, it doesn't matter what size the array is.
def length(array)
  i = 0
  until array[i] == nil
      i += 1
  end
  return i
end


# Prints each integer values in the array
# Time complexity: O(1) because retrieving an element is constant, regardless of the size.
# Space complexity: O(1) because size of the array doesn't matter? Still retrieving one element at a time.
def print_array(array)
  i = 0
  until array[i] == nil
    i += 1
    puts i
  end
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: O(n) for an unsorted array, because of its linear search to find that value.
# Space complexity: O(1), because I'm only looking for 1 value.
def search(array, length, value_to_find)
  i = 0
  while i < length
    if value_to_find == array[i]
      return true
    end
    i += 1
  end
  return false
end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
# Time complexity: O(n) because it involves a linear search for an unsorted array. O(1), if it's sorted because the search will end if it's the first element (largest_value = array[0]).
# Space complexity: O(1), because I'm only looking for 1 value.
def find_largest(array, length)
  i = 1
  largest_value = array[0]

  while i < length
    if array[i] > largest_value
      largest_value = array[i]
    end
    i += 1
  end
  return largest_value
end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
# Time complexity: O(n) because it involves a linear search for an unsorted array. O(1), if it's sorted because the search will end if it's the first element (smallest_val = array[0]).
# Space complexity: O(1), because I'm only looking for 1 value.
def find_smallest(array, length)
  i = 1
  smallest_value = array[0]
  while i < length
    if array[i] < smallest_value
      smallest_value = array[i]
    end
    i += 1
  end
  return smallest_value
end

# Reverses the values in the integer array in place
# Time complexity: O(1), because I'm retrieving one element at a time?
# Space complexity: O(1)
def reverse(array, length)
  i = 0
  last_val = length - 1

  while i < last_val
    temp = array[i]
    array[i] = array[last_val]
    array[last_val] = temp
    i += 1
    last_val -= 1
  end

  return array
end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: O(log n), to narrow down my search by n/2 after an iteration, and then n/4 if there's another iteration that's needed to find the value.
# Space complexity: O(1), because I'm only looking for 1 value.
def binary_search(array, length, value_to_find)
  low_val = 0
  high_val = length - 1

  while low_val <= high_val
    mid = (low_val + high_val) / 2

    if array[mid] == value_to_find
      return true
    elsif array[mid] > value_to_find
      high_val = mid - 1
    elsif array[mid] < value_to_find
      low_val = mid + 1
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
