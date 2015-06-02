def reverser
 a = yield.split
 a.map! do |word| 
 	word.reverse 
 end	
 	a.join(" ")	
end

def adder(x = 1)
  yield + x 
end	

def repeater(input = 1)
  input.times do 
    yield
  end  
end