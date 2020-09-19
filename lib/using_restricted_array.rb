# frozen_string_literal: true

require_relative 'restricted_array.rb'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil

# Time complexity: O(n)
# Space complexity: O(1)
def length(array)
  i = 0
  i += 1 until array[i].nil?
  i
end

# Prints each integer values in the array
# # Time complexity: O(n)
# # space = Space complexity: O(1)
#
def print_array(array)
  i = 0
  until array[i].nil?
    i += 1
    # p array[i]
  end
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: O(n)
# Space complexity: O(1)
def search(array, length, value_to_find)
  (0..length).each do |i|
    return true if value_to_find == array[i]
  end
  false
end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
# Time complexity: O(n)
# Space complexity: O(1)
def find_largest(array, length)
  largest = array[0]
  i = 0
  while i < length
    largest = array[i] if array[i] > largest
    i += 1
  end
  largest
end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
# Time complexity: O(n)
# Space complexity: O(1)
def find_smallest(array, length)
  smallest = array[0]
  i = 0
  while i < length
    smallest = array[i] if array[i] < smallest
    i += 1
  end
  smallest
end

# Reverses the values in the integer array in place
# Time complexity: O(n)
# Space complexity: O(1)
def reverse(array, length)
  return if length <= 1

  i = 0
  j = length - 1

  while i < j
    temp = array[i]
    array[i] = array[j]
    array[j] = temp

    i += 1
    j -= 1
  end
end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: O(Log n)
# Space complexity: O(1)
def binary_search(array, length, value_to_find)

  if length < 1 #You c
    return
  end

  min = 0
  max = length - 1

  until min > max
    guess = ((min + max) / 2)
    if array[guess] == value_to_find
      return true
    elsif array[guess] < value_to_find
      min = guess + 1
    else array[guess] > value_to_find
      max = guess - 1
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
# --- END OF METHODS ---
