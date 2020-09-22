require_relative 'restricted_array.rb'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil
# Time complexity: O(n) - it has to iterate through each item in the array, so take that much time.
# Space complexity: it's just storing the 1 value, so won't take up much space.
def length(array)
  i = 0 #index
  until array[i].nil?
    array[i]
    i += 1
  end

  length = i #just for clarity
  return length
end

#p length(RestrictedArray.new(6))

# Prints each integer values in the array
# Time complexity: O(n) - the time to iterate through each item in the array.
# Space complexity: I think none?  Because it's printing it?  no saving it anywhere?
def print_array(array)
  length = length(array)
  i = 0 #index

  while i < length
    print array[i].to_s + ", "
    i += 1
  end

  print array[length - 1]

end

#print_array(RestrictedArray.new(10))

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: O(n) - (in the worst case) because it iterates through each element.
# Space complexity: Very small, it's just giving true/false value.  I even want to say none - because it's not storing anything?
def search(array, length, value_to_find)

  i = 0
  while i < length
    if array[i] == value_to_find
      return true
      #p "Value #{value_to_find} found at index #{i}. #{array[i]}"
    end
    i += 1
  end

  return false #returns false
end

#search([24, 333, 51, 2, 68], 5, 51)

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
# Time complexity: O(n) - it has to iterate through the whole array.
# Space complexity: ? small?  because it's only saving 1 element but then you are saving over it multiple times.
def find_largest(array, length)
  return nil if length == 0 #my attempt at post fix conditional

  largest_value = array[0]
  i = 0

  while i < length
    if array[i] > largest_value
      largest_value = array[i]
    end
    i += 1
  end

  #p largest_value
  return largest_value
end

#find_largest([2, 46, 73, 12, 42, 113], 6)

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
# Time complexity: O(n) same as above
# Space complexity: ?
def find_smallest(array, length)
  return nil if length == 0 #my attempt at post fix conditional

  smallest_value = array[0]
  i = 0

  while i < length
    if array[i] < smallest_value
      smallest_value = array[i]
    end
    i += 1
  end

  #p smallest_value
  return smallest_value
end

#find_smallest([12, 46, 73, 2, 42, 113], 6)

# Reverses the values in the integer array in place
# Time complexity: O(n/2)? -  Half compared to linear way of doing it... because you are done when you are half way through the array.
# Space complexity: ?  Very small because you are only saving 1 variable to replace the item, otherwise you are just using the existing array.
def reverse(array, length)
  return array if length <= 1

  # p array
  i = 0
  while i < (length/2)
    replace = array[i]
    array[i] = array[length - (i+1)]
    array[length - (i+1)] = replace
    i += 1

  end
  # p array
  return array
end

# reverse([1, 2, 3, 4, 5], 5)
# reverse([1, 2, 3, 4], 4)

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: O(log n) It would take much less time than a linear search.
# Space complexity: ?  you do have to temporarily save the 3 index values low, high & mid to compare.  And then you are only returning true/false.  But then there is also how are you saving the sorted array?  That could take a lot of space...
def binary_search(array, length, value_to_find)
  low_i = 0
  high_i = length - 1

  while low_i <= high_i
    mid = (low_i + high_i) / 2 #calculate the middle
    if array[mid] == value_to_find
      return true
    elsif array[mid] > value_to_find
      high_i = mid - 1
    else #array[mid] < value_to_find
      low_i = mid + 1
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
