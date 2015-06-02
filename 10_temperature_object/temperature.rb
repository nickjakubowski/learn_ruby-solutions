class Temperature	

#constructor accepts an options hash and assigns instance variables
def initialize(opts={})
@f = opts[:f]
@c = opts[:c]
end

#factory methods provide proper format for argument
def self.from_celsius(c)
  Temperature.new(:c => c)
end 

def self.from_fahrenheit(f)
  Temperature.new(:f => f)
end

def in_fahrenheit(opts = {})
  if @c
  (@c * 1.8) + 32
  elsif @f	
  @f
  else
  "No temp data"  
  end
end	

#round keeps answer to nearest 10th
def in_celsius(opts = {})
  if @f
  temp = (@f - 32) / 1.8
  temp.round(1)
  elsif @c
  @c
  else
  "No temp data"	
  end
end
end

class Celsius < Temperature
 
 #super calls the method of the same name in the parent class
  def initialize(c)
    super(:c => c)
  end

end

class Fahrenheit < Temperature

  def initialize(f)
    super(:f => f)
  end


end  
	