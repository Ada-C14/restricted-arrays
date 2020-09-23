require_relative 'restricted_array.rb'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil
# Time complexity: Time complexity is O(1) because the arry has a fixed length of 20
# Space complexity: I think also O(1) since it is a fixed amount that it can hold
def length(array)
  count = 0

  until array[count].nil?
    count +=1
  end
  return count
end

# Prints each integer values in the array
# Time complexity: if array length does not got past 20, o(1), but if it increases o(n) because the more/less values the more/less time to process
# Space complexity: pretty much the same as above, there are no new values added past 20 or new arrays created
def print_array(array)
  p array
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: o(n) because it's not sorted so the more values it has to go through to find a specific value, the longer it takes
# Space complexity: o(1) just sorting and not adding values
def search(array, length, value_to_find)
  count = 0
  until array[count] == value_to_find || count == length
    count += 1
  end

  if array[count] == value_to_find
    return true
  else
    return false
  end
end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
# Time complexity: for each value that is not the largest value, the more time it will take - o(n)
# Space complexity: no new arrays - o(1)
def find_largest(array, length)
  largest_number = 0
  length.times do |index|
    if array[index] > largest_number
      largest_number = array[index]
    end
  end
  return largest_number
end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
# Time complexity: same as for largest integer in unsorted array - or each value that is not the largest value, the more time it will take - o(n)
# Space complexity: same - no new arrays - o(1)
def find_smallest(array, length)
  smallest_number = array[0]
  length.times do |index|
    if array[index] < smallest_number
      smallest_number = array[index]
    end
  end
  return smallest_number
end

# Reverses the values in the integer array in place
# Time complexity: for set length O(1), for any array length O(n)
# Space complexity: O(1) because reverses in place, no new array is made
def reverse(array, length)
  index = 0
  reverse_index = length - 1

  while index < reverse_index
    temp = array[index]
    array[index] = array[reverse_index]
    array[reverse_index] = temp

    index += 1
    reverse_index -= 1
  end

  # length.times do |index|
  #   temp = array[index]
  #   a = array
  #   b = array
  # end
end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: o(nlog n) - since doing the opposite of loop and cutting array in half
# Space complexity: o(1) since no new array is being created
def binary_search(array, length, value_to_find)
  # take the length and divide in half,
  half_array = length / 2
  start_index = 0
  end_index = length - 1

  # until value is found or until start and end are the same and don't match value to find
  until array[half_array] == value_to_find || half_array == 0
  # determine if number is below or above that half value,
    if value_to_find > half_array
      start_index = half_array
    elsif value_to_find < half_array
      end_index = half_array
    end
    end_index / 2
  end

  value_to_find == array[half_array]

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
