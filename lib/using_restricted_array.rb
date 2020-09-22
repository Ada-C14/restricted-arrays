# frozen_string_literal: true
require_relative 'restricted_array.rb'
Minitest::Reporters.use!
Minitest::Reporters::SpecReporter.new
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil
# Time complexity: 0(n) Linear: iteration depends on length, we have to go through the array until we find the termination character nil.
# Space complexity: O(1); uses constant memory, doesn't matter how big array is, we have one counter, no new data structures being created
def length(array)
  # raise NotImplementedError
  i = 0
  i += 1 until array[i].nil?
  i
end

# Prints each integer values in the array
# Time complexity: O(n) linear, in order to print every element in array we have to go through entire array.
# Space complexity: O(1) uses constant amount of memory, prints elements in array. No matter how array changes,
# new memory is not taken up for this method.
def print_array(array)
  i = 0
  until array[i].nil?
    print array[i]
    i += 1
  end
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: O(n) linear, have to iterate through array until we find it.
# Space complexity: O(1), constant memory,
def search(array, length, value_to_find)
  # raise NotImplementedError
  length.times do |i|
    return true if value_to_find == array[i]
  end
  return false
end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
# Time complexity: O(n) linear: since it's unsorted, will have to go through the entire array until the largest value is found.
# Space complexity: O(1) memory usage does not change for this method, it is constant.
def find_largest(array, length)
  #raise NotImplementedError
  return nil if length.nil? || length.zero?

  largest_value = array[0]
  i = 1
  while i < length
    largest_value = array[i] if array[i] > largest_value
    i += 1
  end

  largest_value

end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
# Time complexity:  O(n) linear: since it's unsorted, will have to go through the entire array until the smallest value is found.
# Space complexity: O(1) memory usage does not change for this method, it is constant.
def find_smallest(array, length)
  #raise NotImplementedError
  return nil if length.nil? || length.zero?

  min_value = array[0]
  i = 1
  while i < length
    min_value = array[i] if array[i] < min_value
    i += 1
  end

  min_value

end

# Reverses the values in the integer array in place
# Time complexity: O(n)  execute in linear time as compared to the size of the input
# Space complexity: O(1) constant space complexity; since it is in place. Amount of memory used does not change as the size of the input array changes.
# Note: There are 3 memory allocations created for the 3 variables created(i,j,temp) but once created these do not change as input array size changes.
def reverse(array, length)
  #raise NotImplementedError
  return nil if length <= 1

  first = 0
  last = length - 1

    while first < last
      temp = array[first]
      array[first] = array[last]
      array[last] = temp

      first += 1
      last -= 1
    end

end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: O(log n), the data set size affects the efficiency of the algorithm in a logarithmic fashion
# Space complexity: O(1), memory used does not change as the size of the input array changes
def binary_search(array, length, value_to_find)
  #raise NotImplementedError
  return false if length.zero?

  low = 0
  high = length - 1

  while low < high
    mid = low + high / 2
    if array[mid] == value_to_find
      return true
    elsif array[mid] > value_to_find
      high = mid - 1
    elsif array[mid] < value_to_find
      low = mid + 1
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
