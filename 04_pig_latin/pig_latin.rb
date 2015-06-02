def translate_vowel(x)
  a = x.split("")
  a.push("ay")
  a.join("")
end	

# word is split into an array to identify individual letters
# "qu" and "sch" is single phenome "u" is vowel and consonants follow "sch" in many words
# letter is copied, shifted and pushed to the end of the array as needed
# "ay" is added to the end of the array then turn back into a string with join
# solves multiple consanants with while loop
def translate_consonant(y)
  b = y.split("") 
  while b[0].match (/[bcdfghjklmnpqrstvwxyz]/)
    if b[0..2] == (["s","c","h"])
    e = b.slice(0..2)
    b.shift(3)
    b.push(e)
    elsif 
    b[0].match (/[q]/)
    d = b.slice(0..1)
    b.shift(2)
    b.push(d)  
    else 
    c = b.slice(0)
    b.shift
    b.push(c)
    end
  end
  b.push("ay")
  b.join("") 
end	

public
def translate_segue(input)
  if input[0].match (/[aeiou]/)
    translate_vowel(input)
    else
    translate_consonant(input)
  end 
end

# words are put into an array to count the number of words in the string 
# words then sent to translate_segue to determine correct modification
# words joined back into string
#
def translate(word)
  d = word.split
  if d.count < 2
    d.join
    translate_segue(word)
  else
    d.map! do |word| 
    word.translate_segue(word)
    end 
  d.join(" ")   
  end
end    	