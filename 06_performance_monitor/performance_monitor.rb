def measure(block = 1)
 x = Time.now
 block.times do
 	yield	
 end
 y = Time.now
 time = y-x
 if block > 1  
   time / block	
 else 
   time
 end
end	