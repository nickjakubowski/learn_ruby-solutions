def ftoc(ftemp)
# any result that is a float is rounded	
 result = (ftemp - 32.0) / 1.8
 if result.is_a?Float
   result.round
 else
   result 
 end
end

def ctof(ctemp)
  (ctemp * 1.8) + 32	
end