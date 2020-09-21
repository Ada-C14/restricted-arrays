require_relative 'restricted_array.rb'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil
# Time complexity: for n = array.length, time complexity is linear O(n).
# Space complexity: O(1) - constant space complexity (just one integer created regardless of array size).
def length(array)
  i = 0
    until array[i] == nil
      i += 1
    end
    return i
end

# Prints each integer values in the array
# Time complexity: for n = array.length, time complexity is linear O(n)
# Space complexity: constant space complexity O(1) - just one integer created regardless of array size.
def print_array(array)
  i = 0
  while i < array.length - 1
    print "#{array[i]} "
    i += 1
  end
  print "#{array[i]}"
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: O(n) - linear (will iterate n times, until it finds the value searched)
# Space complexity: O(1) - constant (won't change regardless of array size)
def search(array, length, value_to_find)
  i = 0
  while i < length
    if value_to_find == array[i]
      return true
    else
      i += i
    end
  end
  return false
end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
# Time complexity: for n = array.length, time complexity is linear O(n)
# Space complexity: O(1) - constant
def find_largest(array, length)
  i = 0
  largest = 0
  while i < length
    if array[i] > larger
      largest = array[i]
      i += 1
    else

      i += 1
    end
  end
  return largest
end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
# Time complexity: linear O(n) - for n = array.length, will iterate n times to check smallest value
# Space complexity: O(1) - constant (remains the same regardless of array size)
def find_smallest(array, length)
  i = 0
  smallest = array[0]
  while i < length
    if array[i] < smallest
      smallest = array[i]
    end
    i += 1
  end
  return smallest
end

# Reverses the values in the integer array in place
# Time complexity: O(n) - for n = array.length, will iterate n times to reverse all values
# Space complexity: O(1) - constant
def reverse(array, length)
  original_index = 0
  swap_index = length - 1

  while original_index < swap_index
    original_value = array[original_index]
    swap_value = array[swap_index]

    array[original_index] = swap_value
    array[swap_index] = original_value

    original_index += 1
    swap_index -= 1
  end
  return array
end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: it depends; if best case applies, then linear O(1). If not, log(n)
# Space complexity: constant O(1) - (remains the same)
def binary_search(array, length, value_to_find)
  start = 0
  finish = length - 1

  while finish > start
    middle = (start + finish) / 2
    if array[middle] == value_to_find
      return true
    elsif array[middle] < value_to_find
      start = middle + 1
    elsif array[middle] > value_to_find
      start = middle - 1
    end
  end
  return array[start] == value_to_find ? true : false
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
