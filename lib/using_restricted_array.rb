require_relative 'restricted_array.rb'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil
# Time complexity: O(n): This algorithm requires n steps, as it is only one loop. n is the length of the array
# Space complexity: O(1): The memory required by this algorithm is constant, it does not depend of the size of input

def length(array)
  index = 0
  length_of_array = 0
  return nil if array[index] == 0
  while array[index] != nil
    index += 1
    length_of_array += 1
  end
  return length_of_array
end

# Prints each integer values in the array
# Time complexity: O(n): n = the number of values in the array, the algorithm will loop through each value once
# Space complexity: O(1): the amount of memory this algorithm takes is constant
def print_array(array)
  index = 0
  all_numbers = ""
  return nil if array[index] == 0
  while array[index] != nil
    all_numbers += "#{array[index]} "
    index += 1
  end
  return all_numbers
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: O(n): the algorithm will loop through each value once, n is the number of elements in the array
# Space complexity: O(1): no other data structures were created

def search(array, length, value_to_find)
  index = 0
  in_array = false
  return nil if length == 0
  while index < length
    if array[index] == value_to_find
      in_array = true
    end
    index += 1
  end
  return in_array
end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
# Time complexity: O(n): the algorithm loops through each value to find the largest value (worst case max value is at index length - 1), n is the number of elements in the array
# Space complexity: O(1): no other data structures are created

def find_largest(array, length)
  index = 0
  largest_value = array[index]
  return nil if length == 0
  while index < length
    if array[index] > largest_value
      largest_value = array[index]
    end
    index += 1
  end
  return largest_value
end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
# Time complexity: O(n): algorithm loops through each value to find the smallest (worst case, smallest is at the last index), n is the number of elements in the array
# Space complexity: O(1): no new data structures are created

def find_smallest(array, length)
  index = 0
  smallest_number = array[index]
  return nil if length == 0
  while index < length
    if array[index] < smallest_number
      smallest_number = array[index]
    end
    index += 1
  end
  return smallest_number
end

# Reverses the values in the integer array in place
# Time complexity: O(n): each value must be looped through to switch positions in the array, n is the number of elements in the array
# Space complexity: O(1): the array is still stored in the same variable so no new data structures are created

def reverse(array, length)
  i=1
  return nil if length == 0
  while i <= length/2
    temp = array[i-1]
    array[i-1] =  array[length-i]
    array[length-i] = temp
    i+=1
  end
  return array
end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: O(log2): at each step, half of the array gets eliminated. n = number of elements in the array. After the first iteration the number of elements is n/2, second iteration is n/4 etc.
# Space complexity: O(1): No new arrays or data structures are being created

def binary_search(array, length, value_to_find)
  low = 0
  high = length - 1
  return nil if length == 0
  while low < high
    mid = (low + high) / 2
    if array[mid] == value_to_find
      return true
    elsif array[mid] > value_to_find
      high = mid - 1
    elsif array[mid] < value_to_find
      low = mid + 1
    end
  end
  if array[low] == value_to_find
    return true
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
