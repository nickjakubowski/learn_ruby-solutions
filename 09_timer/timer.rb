class Timer	

attr_accessor :seconds	

def seconds
  start = Time.now
  stop = Time.now
  stop - start
end	

# divmod returns an array of the quotient and remainder
# if the quotient is divisible by 60 #divmod is used again 
# providing hours and minutes, and seconds are pushed onto the back of array
# single digit numbers are padded with 0
# words are converted into string with the separator
#
def time_string
  clock = @seconds.divmod(60)
  if clock[0] > 59
  	b = clock[1]
    a = clock[0].divmod(60)
    clock = a.push(b)
  else
    clock.unshift(0)
  end
clock.map! do |final|
  if final < 10
    "0" + final.to_s
  else
    final  
  end
end
  clock.join(":")	
end	

end	 