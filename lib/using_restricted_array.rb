# Pauline Chane (@PaulineChane on GitHub)
# Ada Developers Academy C14
# CS Fun - using_restricted_array.rb for Restricted Arrays assignment
# 09/22/2020
require_relative 'restricted_array.rb'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil
# Time complexity: O(n) or linear. The time depends directly on how many elements are in the input array.
#                  Generally, an array of size x will take (nx * 1/n) time to process compared to an array of size nx.
#                  This means an array of size x takes half the time (2x* 1/2) to process than an array of size 2x.
# Space complexity: O(1) or constant. Only one variable is created and used throughout the entire function, i.
#                   This variable does not depend on array size.
def length(array)
  i = 0
  i += 1 until array[i].nil?
  return i
end

# Prints each integer values in the array
# Time complexity: O(n) or linear. The time depends directly on how many elements are in the input array.
#                  Generally, an array of size x will take (nx * 1/n) time to process compared to an array of size nx.
#                  This means an array of size x takes half the time (2x* 1/2) to process than an array of size 2x.
# Space complexity: O(1) or constant. Only one variable is created and used throughout the entire function, i.
#                   Printing an array doesn't affect its space complexity.
#                   This variable does not depend on array size.
#                   That said I'm reading this has something to do with automatic garbage collection?
def print_array(array)
  i = 0
  until array[i].nil?
    print array[i].to_s + ' '
    i += 1
  end
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: O(n) or linear -- linear search to be exact. The worst case time (end of array has value_to_find) depends directly on how many elements are in the input array.
#                  Generally, an array of size x will take (nx * 1/n) time to process compared to an array of size nx.
#                  This means an array of size x takes half the time (2x* 1/2) to process than an array of size 2x.
# Space complexity: O(1) or constant. Only one variable is created and used throughout the entire function, i.
#                   This variable does not depend on array size.
def search(array, length, value_to_find)
  i = 0
  while i < length
    if array[i] == value_to_find
      return true
    end
    i += 1
  end
  return false
end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
# Time complexity: O(n) or linear -- linear search to be exact. The worst case time (last array element is largest) depends directly on how many elements are in the input array.
#                  Generally, an array of size x will take (nx * 1/n) time to process compared to an array of size nx.
#                  This means an array of size x takes half the time (2x* 1/2) to process than an array of size 2x.
# Space complexity: O(1) or constant. Two variables created and used throughout the entire function, i and largest.
#                   These variables do not depend on array size (Meaning they will occupy the same memory slots throughout).
def find_largest(array, length)
  largest = length < 1 ? nil : array[0]

  unless largest.nil?
    i = 0

    until i == length do
      largest = array[i] if array[i] > largest
      i += 1
    end

  end

  return largest
end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
# Time complexity: O(n) or linear -- linear search to be exact. The worst case time (last array element is smallest) depends directly on how many elements are in the input array.
#                  Generally, an array of size x will take (nx * 1/n) time to process compared to an array of size nx.
#                  This means an array of size x takes half the time (2x* 1/2) to process than an array of size 2x.
# Space complexity: O(1) or constant. Two variables created and used throughout the entire function, i and smallest.
#                   These variables do not depend on array size (Meaning they will occupy the same memory slots throughout).
def find_smallest(array, length)
  smallest = length < 1 ? nil : array[0]

  unless smallest.nil?
    i = 0

    until i == length do
      smallest = array[i] if array[i] < smallest
      i += 1
    end

  end

  return smallest
end

# Reverses the values in the integer array in place
# Time complexity: O(n) or linear -- linear search to be exact. The time ALWAYS depends directly on how many elements are in the input array.
#                  This means an array of size x takes half the time (2x* 1/2) to process than an array of size 2x.
#                  Generally, an array of size x will take (nx * 1/n) time to process compared to an array of size nx.
#                  Even though the function will traverse through half the array, the scaling of the time complexity does not change.
# Space complexity: O(1) or constant. Three variables created and used throughout the entire function -- half-point, i, and temp.
#                   These variables do not depend on array size (Meaning they will occupy the same memory slots throughout).
#                   Although the temp variable will be called n/2 times maximum, n being the length of the array to be traversed,
#                   the temp variable will only occupy one space of memory at a time, compared to consistently occupying
#                   more and more space as the loop traverses. Thus, despite the time variable the space complexity is
#                   still O(1) or constant.
def reverse(array, length)
  half_point = length/2
  i = 0
  until i == half_point do
    temp = array[i]
    array[i] = array[length - 1 - i]
    array[length - 1 - i] = temp
    i += 1
  end
end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: O(log n) or logarithmic. The runtime for the worst case (first/last elements of array) depends on log_2_(length of array), or how many times
#                  the length of the array can be split in half before (or if) the item is found (aka number of comparisons).
# Space complexity: O(1) or constant. Three variables created and used throughout the entire function -- min, max, and mid.
#                   These variables do not depend on array size (Meaning they will occupy the same memory slots throughout).
def binary_search(array, length, value_to_find)
  mid = length/2
  min = 0
  max = length - 1
  while min <= max do

    if array[mid] == value_to_find
      return true
    elsif array[mid] < value_to_find
      min = mid + 1
    else
      max = mid - 1
    end

    mid = (min + max)/2
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
