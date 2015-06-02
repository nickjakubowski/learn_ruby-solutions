module InWords

@@ones = { 0 => "zero", 1 => "one", 2 => "two", 3 => "three", 4 => "four", 5 => "five", 
				 6 => "six", 7 => "seven", 8 => "eight", 9 => "nine"}
@@tens = { 10 => "ten", 11 => "eleven", 12 => "twelve", 13 => "thirteen", 14 => "fourteen", 
				 15 => "fifteen", 16 => "sixteen", 17 => "seventeen", 18 => "eighteen", 19 => "nineteen", 
				 20 => "twenty", 30 => "thirty", 40 => "forty", 50 => "fifty", 60 => "sixty",
				 70 => "seventy", 80 => "eighty", 90 => "ninety" }


def Fixnum.under_hun(n)
	n = n.to_i.to_s	
	if n.length == 2
		if n[0] == "1" || n[1] == "0"
			@@tens[n.to_i]
		elsif n[1] != "0"
			@@tens[(n[0] + "0").to_i] + " " + @@ones[n[1].to_i]	
		end		
	else
		@@ones[n.to_i]	 
	end	
end	

def Fixnum.under_thou(num)
	if num.to_i.to_s.length == 3
		if num[1] != "0"
		@@ones[(num[0]).to_i] + " hundred " + Fixnum.under_hun(num[1..2])
		else
			@@ones[(num[0]).to_i] + " hundred"
		end	
	else
		Fixnum.under_hun(num)
	end	
end	

def Fixnum.under_mil(numb)
	numb = numb.to_i.to_s
	if (4..6).include?(numb.to_i.to_s.length)	
		if numb.to_i.to_s.length == 6
			Fixnum.under_thou(numb[0..2]) + " thousand" + " " + Fixnum.under_thou(numb[3..-1])
		elsif numb.length == 5
			Fixnum.under_hun(numb[0..1]) + " thousand" + " " + Fixnum.under_thou(numb[2..-1]) 
		else
			Fixnum.under_hun(numb[0]) + " thousand" 
		end			
	else
		Fixnum.under_thou(numb)	
	end	
end	

def Fixnum.under_bil(numba)
	if (7..9).include?(numba.to_i.to_s.length)	
		if numba.length == 9 && (numba[0..2]).to_i.to_s.length == 3
			Fixnum.under_thou(numba[0..2]) + " million" + " " + Fixnum.under_mil(numba[3..-1])
		elsif numba.length == 8 && (numba[0..1]).to_i.to_s.length == 2
			Fixnum.under_hun(numba[0..1]) + " million" + " " + Fixnum.under_mil(numba[2..-1])
		else numba.to_i.to_s.length == 7 && (numba[0]).to_i.to_s.length == 1
			Fixnum.under_hun(numba[0]) + " million" 
		end			
	else
		Fixnum.under_mil(numba)	
	end		
end	

def Fixnum.under_tril(numbe)
	if (10..12).include?(numbe.to_i.to_s.length)
		if numbe.length == 12 && (numbe[0..2]).to_i.to_s.length == 3
			Fixnum.under_thou(numbe[0..2]) + " billion" + " " + Fixnum.under_bil(numbe[3..-1])
		elsif numbe.length == 11 && (numbe[0..1]).to_i.to_s.length == 2
			Fixnum.under_hun(numbe[0..1]) + " billion" + " " + Fixnum.under_bil(numbe[2..-1])
		elsif numbe.length == 10 && (numbe[0]).to_i > 0
			Fixnum.under_hun(numbe[0]) + " billion" + " " + Fixnum.under_bil(numbe[1..-1])
		else
			Fixnum.under_hun(numbe[0]) + " billion"	
		end			
	else
		Fixnum.under_bil(numbe)
	end	
end	

#require 'debugger'
def in_words

#debugger	

number = self.to_s.delete("_")

if (13..15).include?(number.to_i.to_s.length)
	if number.length == 15 && (number[0..2]).to_i.to_s.length == 3
		Fixnum.under_thou(number[0..2]) + " trillion" + " " + Fixnum.under_tril(number[3..-1])
	elsif number.length == 14 && (number[0..1]).to_i.to_s.length == 2
		Fixnum.under_hun(number[0..1]) + " trillion" + " " + Fixnum.under_tril(number[2..-1])
	elsif number.length == 13 && number[1..-1].to_i > 0
		Fixnum.under_hun(number[0]) + " trillion " + Fixnum.under_tril(number[1..-1]) 
	else
		Fixnum.under_hun(number[0]) + " trillion"	
	end			
else
	Fixnum.under_tril(number)
end	

#if __FILE__ == $PROGRAM_NAME
 # in_words(1_000_000_000_000)
#end 
end	


end

class Fixnum
  include InWords
end

class Bignum
  include InWords
end