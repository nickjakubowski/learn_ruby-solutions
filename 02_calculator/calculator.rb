def add(a, b)
  a + b
end

def subtract(a, b)
  a - b
end

def sum(numbers)
  numbers.inject(0) { |sum, number| sum + number }
end

def multiply(numbers)
  numbers.inject(1) {|product, number| product * number}
end

def power(base, ex)
 base ** ex.to_f
end

def factorial(num)  	
# multiply a given number by all the numbers less than itself greater than 0 
  (1..num).inject(1) { |product, n| product * n } 
end