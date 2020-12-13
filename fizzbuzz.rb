# Challenge: Write a program that loops through the numbers 1-100. For each number: 
# - Your program should output 'Fizz' if the number is divisible by 3.
# - Your program should output 'Buzz' if the number is divisible by 5.
# - Your program should output 'FizzBuzz' if the number is divisible by both 3 and 5.


# A typical approach: 
def fizzbuzz_1
  [*1..100].each do |n|
    if n % 3 == 0 && n % 5 == 0
      puts 'FizzBuzz'
    elsif n % 3 == 0
      puts 'Fizz'
    elsif n % 5 == 0
      puts 'Buzz'
    else 
      puts n
    end
  end
end
# Test it:
puts "\n\nApproach 1"
p fizzbuzz_1


# Same concept but using a case statement:
def fizzbuzz_2
  [*1..100].each do |n|
    case 
    when n % 15 == 0 then puts "FizzBuzz"
    when n % 3  == 0 then puts "Fizz"
    when n % 5  == 0 then puts "Buzz"
    else puts n
    end
  end
end
# Test it:
puts "\n\nApproach 2"
p fizzbuzz_2


# Potentially a slightly simpler approach:
def fizzbuzz_3
  [*1..100].each do |n|
    string = ''
    string += 'Fizz' if n % 3 == 0
    string += 'Buzz' if n % 5 == 0

    puts string.empty? ? n : string
  end
end
# Test it:
puts "\n\nApproach 3"
p fizzbuzz_3


# Same idea as above, with a slight tweak:
def fizzbuzz_4
  rules = { 3 => 'Fizz', 5 => 'Buzz' }

  [*1..100].each do |n|
    str = ''
    rules.each { |k, v| str += v if n % k == 0 }
    puts str.empty? ? n : str
  end
end
# Test it:
puts "\n\nApproach 4"
p fizzbuzz_4


# Same idea as the above approach, but using each_with_object. 
# (Note: this is much less readable/efficient):
def fizzbuzz_5
  rules = { 3 => 'Fizz', 5 => 'Buzz' }

  [*1..100]
    .each_with_object(Hash.new('')) do |n, obj| 
      rules.each do |k, v| 
        n % k == 0 ? obj[n] += v : obj[n] += '' 
      end
    end
    .each { |k, v| puts v.empty? ? k : v }
end
# Test it:
puts "\n\nApproach 5"
p fizzbuzz_5
