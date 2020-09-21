require_relative 'restricted_array.rb'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil
# Time complexity: O(n), where n is the length of the array
# To find the length, it will take n times to iterate through the array
# This will be a O(n) in Big O terms
# Space complexity: Constant or O(1)
# Uses constant amount of memory
def length(array)
  index = 0

  until array[index].nil?
    index += 1
  end

  return index
end

# Prints each integer values in the array
# Time complexity: O(n), where n is the length of the array
# To print each integer, it will take n times to iterate through the array
# Space complexity: Constant or O(1)
# Uses constant amount of memory
def print_array(array)
  print "#{array[0]}"
  index = 1

  until index == length(array)
    print " #{array[index]}"
    index += 1
  end
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: O(n), where n is the length of the array
# It takes the value to find and check it with each element of the array
# it will take n times to compare
# Space complexity: Constant or O(1)
# Uses constant amount of memory
def search(array, length, value_to_find)
  index = 0

  while index < length
    if value_to_find == array[index]
      return true
    end
    index += 1
  end

  return false
end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
# Time complexity: O(n), where n is the length of the array
# To find the largest integer, it does an n amount of comparisons
# Space complexity: Constant or O(1)
# Uses constant amount of memory
def find_largest(array, length)
  largest_int = array[0]
  index = 1

  while index < length
    if array[index] > largest_int
      largest_int = array[index]
    end
    index += 1
  end

  return largest_int
end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
# Time complexity: O(n), where n is the length of the array
# To find the smallest integer, it does an n amount of comparisons
# Space complexity: Constant or O(1)
# Uses constant amount of memory
def find_smallest(array, length)
  smallest_int = array[0]
  index = 1

  while index < length
    if array[index] < smallest_int
      smallest_int = array[index]
    end
    index += 1
  end

  return smallest_int
end

# Reverses the values in the integer array in place
# Time complexity: O(n/2) = > O(n), where n is the length of the array
# It take half the length to iterate through the array which is n/2
# Converting it to Big O terms, O(n)
# Space complexity: Constant or O(1)
# Uses constant amount of memory
# The values swap places but still uses the same amount of memory
def reverse(array, length)
  a = 0
  b = length - 1

  while a < b
    array[a], array[b] = array[b], array[a]
    a += 1
    b -= 1
  end

  return array
end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: O(logn), where n is the length of the array
# Through each iteration, the length of the array gets halved
# It takes half of n each iteration to compare to the value to find
# Space complexity: Constant or O(1)
# Uses constant amount of memory
def binary_search(array, length, value_to_find)
  if length == 0
    return false
  end

  # min and max index
  min = 0
  max = length - 1

  while min <= max
    mid = (min + max)/2

    if array[mid] == value_to_find
      return true
    elsif array[mid] < value_to_find
      # value at midpoint is less than the value to find
      # adjust min, eliminate first half
      min = mid + 1
    elsif array[mid] > value_to_find
      # value at midpoint is more than the value to find
      # adjust max, eliminate second half
      max = mid - 1
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
