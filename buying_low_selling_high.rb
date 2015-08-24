# Write a method to calculate the maximum possible profit I could have made by buying low and
# selling high, given an array of mutual fund NAVs (end of day prices) for every day in a time
# interval. For example, for the array [7,24,8,15,2,20], the maximum profit would have been 18, by
# buying at 2 on day 5 and selling at 20 on day 6.

# Assume: buy and sell once each 

require 'pry'

class BuyingLowSellingHigh

  attr_accessor :profit

  def initialize(price_array)
    @price_array = price_array
  end

  def calculate
    initialized_array_valid? ? calculate_profit : invalid_initialized_array_statement
  end

  private

  def calculate_profit
    find_max_profit
    solution_valid? ? profit_statement : no_profit_statement
  end

  def invalid_initialized_array_statement
    puts "Entry invalid. Please try again."
  end

  def profit_statement
    puts "You could have made $#{@profit}."
  end

  def no_profit_statement
    puts "It would have been impossible to make money in this scenario."
  end

  def initialized_array_valid? 
    @price_array.class == Array
  end

  def solution_valid?    
    !@profit.nil? 
  end

  def make_new_array_slice_from_start
    @new_array = []
    i = 0
    x = @price_array.length-1
    x.times do 
      @new_array << @price_array[i..-1]
      i+=1
    end
    @new_array 
  end

  def make_new_array_slice_through_end
    make_new_array_slice_from_start
    i = 1
    x = @price_array.length-1
    x.times do 
      @new_array << @price_array[0..i]
      i+=1
    end
    @new_array 
  end
  
  def find_min_max_of_new_arrays
    min_max_array = []
    make_new_array_slice_through_end.each { |x| min_max_array << x.max - x.min if x.index(x.max) > x.index(x.min)}
    min_max_array
  end

  def find_max_profit
    @profit = find_min_max_of_new_arrays.flatten.max
  end

end

a = BuyingLowSellingHigh.new([7,24,8,15,2,20])
a.calculate



