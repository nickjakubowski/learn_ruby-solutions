class RPNCalculator

def initialize
  @calc = []
end	

def raise_exception
 raise "calculator is empty"
end  

def push(n)
  @calc.push(n)
end	

def value
  @calc[-1]
end	

# the calculator requires 2 array values to compute and will fail with less. 
# uses last two values in array and pops them when the operation is finished.
# the result of the specific operation is pushed onto @calc for retrieval or 
# to be applied to another operation. 
def plus
  if @calc.count < 2
    raise_exception
  else  	
    p = @calc[-2] + @calc[-1]
    @calc.pop(2)	
    @calc.push(p)
  end  
end	

def minus
  if @calc.count < 2
    raise_exception
  else 	
    m = @calc[-2] - @calc[-1]
    @calc.pop(2)
    @calc.push(m)
  end  
end	

def divide
  if @calc.count < 2
    raise_exception
  else 	
    d = @calc[-2].to_f / @calc[-1]
    @calc.pop(2)
    @calc.push(d)
  end  
end	

def times
  if @calc.count < 2
    raise_exception
  else 	
    t = @calc[-2] * @calc[-1]
    @calc.pop(2)
    @calc.push(t)
  end  
end	

def tokens(nums)
 a = nums.split
 a.map do |n|
   if n.match(/\d/)
     n.to_i
   else
     n.to_sym   
   end 
end
end


# string is split into an array
# a new array is created with map
# numbers are pushed onto the array or operations performed
# c.last output is an array, e.last output is an integer
def evaluate(str) 
  b = str.split
  c = b.map! do |v|
    if v.to_s.match(/\d/)
      self.push(v.to_i)
    elsif v == "+"
      self.plus
    elsif v == "-"
      self.minus
    elsif v == "/"  
      self.divide
    else v == "*"
      self.times
    end
  end
  e = c.last
  e.last
end  

end