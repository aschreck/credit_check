class Card_Reader

  def number_splitter(card_number) #works
    #convert string into a reversed, usable split array of ints.
    reverse_num = card_number.reverse
    string_array = reverse_num.split("")
    card_array = string_array.map(&:to_i)
  end

  def doubler(array)
  #starting at index 1, double value of every other number going from left to right.
    i = 1
    n = array.length
    while i < n
  #access every other number.
      array[i] = array[i] * 2
      i += 2
    end

    return array
  end


  def double_digit_check(num_array)
  #if result of doubling operation > 9, sum the two places values.
    num_array.collect do |num|
      if num > 9
        num -= 9
      else
        num
      end
    end
  end


  def summation (array)
    #take the sum of all the array elements.
    sum = 0
    array.each { |num| sum += num }
    return sum
  end

  def valid? (number)
    #Test for validity with % 10 == 0
    # If it is valid, print "The number is valid!"
    # If it is invalid, print "The number is invalid!"
    if number % 10 == 0
      puts 'The number is valid!'
    else
      puts 'The number is invalid!'
    end
  end

  def credit_check(card_number)
    reverse_array = number_splitter(card_number)
    doubler(reverse_array)
    corrected_array =double_digit_check(reverse_array)
    sum = summation(corrected_array)
    valid?(sum)
  end
end

input = ARGV.first.to_s
card_reader = Card_Reader.new()
card_reader.credit_check(input)
