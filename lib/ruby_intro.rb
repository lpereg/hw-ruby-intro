# When done, submit this entire file to the autograder.

# Part 1
def sum arr
  # Define a method sum(array) that takes 
  #an array of integers as an argument and
  # returns the sum of its elements. For an 
  #empty array it should return zero. Run associated
  #tests via: $ rspec -e '#sum ' spec/part1_spec.rb

  #set sum to 0 first
  sum = 0

  #then we are doing to use an iteration 'each'
  # collection(in this case it's 'arr').each{| variable(the sum) |}
  arr.each{| v | sum = sum + v}
  return sum    #then returns the sum
end

def max_2_sum arr
  # Define a method max_2_sum(array) which 
  # takes an array of integers as an argument 
  # and returns the sum of its two largest elements. 
  # For an empty array it should return zero. For an
  # array with just one element, it should return that
  # element. Run associated tests via: $ rspec -e '#max_2_sum' spec/part1_spec.rb

  # returns value of the element if just one element
  if arr.size == 1
    arr = arr[0]
    return arr
  elsif arr.empty?
    return 0
  end

  # to find largest and smallest value, let's sort the array
  sorted = arr.sort
  
  # last element
  biggest1 = sorted[-1]
  # second to last element
  biggest2 = sorted[-2]

  #then add them
  arr = biggest1 + biggest2

  #return arr
  return arr 

end

def sum_to_n? arr, n
  # 1)that takes an array of integers and an 
  # additional integer, n, as arguments and 
  # 2)returns true if any two elements in the 
  # array of integers sum to n. sum_to_n?([], n) 
  # 3)should return false for any value of n, by 
  # definition. Run associated tests via: $ rspec -e '#sum_to_n' spec/part1_spec.rb

  # returns true when any two elements sum to the second argument
  #   EX: arr = [1, 2, 3, 4, 5, 6] and n = 5, true because 2 + 3 = 5

  #first, lets find a pair of int's using the combination() array class method
  # combination() returns a 'n' length of a 2D array
  #   EX. arr.combination(2) will retrun [1,2], [3,4], [5,6] bc n=2
  arrPair = arr.combination(2)

  # then use the enumerable find() method to find the sum in the arrPair.
  # return true if the sums = n, otherwise false
  if arrPair.find{|a, b| a + b == n}    #ints a and b, sum of a and b = int n
    return true
  else
    return false
  end

end


######################
# Part 2

def hello(name)
  #takes a string representing a name and 
  # returns the string "Hello, " concatenated 
  # with the name. Run associated tests via: $ rspec -e '#hello' spec/part2_spec.rb 
  
  #The hello method returns the correct string
  hello = "Hello, " + name

  return hello
end

def starts_with_consonant? s
  # takes a string and returns true if it starts 
  # with a consonant and false otherwise. 
  # (For our purposes, a consonant is any letter other than A, E, I, O, U.) 
  # NOTE: be sure it works for both upper and lower case and for nonletters! 
  # Run associated tests via: $ rspec -e '#starts_with_consonant?' spec/part2_spec.rb

  pattern = /^[aeiouAEIOU\W]/
  
  # use regex matching (), match()
  if s.empty?
    return false
  end
  
  if pattern.match(s)
    return false
  else
    return true
  end

end

def binary_multiple_of_4? s
  # that takes a string and returns true 
  # if the string represents a binary number 
  # that is a multiple of 4. NOTE: be sure it 
  # returns false if the string is not a valid binary number! 
  # Run associated tests via: $ rspec -e '#binary_multiple_of_4?' spec/part2_spec.rb

  # multiples of 4 in binary ends in 0
  # so if the string pattern matches a 1 or 0 zero or more and ends with 00
  # then return true
  
  startpattern = /^[10]*/
  endpattern = /^[0$]/
  if (startpattern.match(s) && endpattern.match(s)) 
    return true
  else
    return false
  end

end



######################
# Part 3

class BookInStock
#1) represents a book with an ISBN number, isbn, 
# and price of the book as a floating-point number, price, as attributes. 
# Run associated tests via: $ rspec -e 'getters and setters' spec/part3_spec.rb 

# getters and setters in ruby= attr_accessor :
# this acts as an autmatic getter and setter method
# rather than writing seperate getter and setter methods.  
  attr_accessor :isbn
  attr_accessor :price



#2) The constructor should accept the ISBN number 
# (a string, since in real life ISBN numbers can begin 
# with zero and can include hyphens) as the first argument 
# and price as second argument, and should raise ArgumentError
# (one of Ruby's built-in exception types) if the ISBN number is 
# the empty string or if the price is less than or equal to zero. 
# Include the proper getters and setters for these attributes. 
# Run associated tests via: $ rspec -e 'constructor' spec/part3_spec.rb

#first initalize the variables
  def initialize(isbn, price)
    @isbn = isbn
    @price = price
    
    #raise and error is the isbn is empty or the price <=0
    if isbn.empty?
      raise ArgumentError.new("Error. ISBN is not a number.") 
    end 

    if price<=0
      raise ArgumentError.new("Error. Price is invalid.")
    end

  end
    
  #3) Include a method price_as_string that returns 
# the price of the book formatted with a leading
# dollar sign and two decimal places, that is, a price 
# of 20 should format as "$20.00" and a price of 33.8 should format as "$33.80". 
# Run associated tests via: $ rspec -e '#price_as_string' spec/part3_spec.rb
  def price_as_string
    priceMessage = sprintf("$%0.2f", @price) #sprintf() for formated string
    return priceMessage
  end
 


end

