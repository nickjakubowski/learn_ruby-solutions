class Dictionary	

# new dictionary begins as an empty hash
def initialize
  @@words = {}
end	

def entries
  @@words
end	

#if entry is a string with no definition it is added as a keyword only
#else it is put into an array within an array and the keyword and definition
#are put into the hash by referencing their array position.
def add(entry) 
 if entry.is_a? String
  @@words[entry] = nil
 else   
   learn = entry.to_a 
   learnit = learn[0]
   @@words[learnit[0]] = learnit[1]	
  end
end	

#sorts keys in an array
def keywords
  @@words.keys.sort
end	

def include?(word)
  @@words.include?(word)    
end  

#if word is a match it is included in the hash
#elsif a word starts with the input it is added to the hash
#else a new hash is created to indicate no matches.  
def find(input)
  if include?(input)
    Hash[input, (@@words[input])]
  elsif keywords.any? {|key| key.start_with?(input)}
     @@words.select {|key, value| key.start_with?(input)}
  else
    Hash.new
  end   
end 

#sorts hash in an array and outputs new array is specific format.
#joined into string
def printable
  list = @@words.to_a.sort.map {|word,definition| "[#{word}] \"#{definition}\""}
  list.join("\n")
end  

end


