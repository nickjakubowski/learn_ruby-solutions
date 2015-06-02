require 'linguistics'
Linguistics.use( :en )

def echo(word)
  word
end

def shout(outloud)
  outloud.upcase
end

# strip removes leading and trailing whitespace
def repeat(word, times = 2)
  ((word + ' ') * times).strip
end

def start_of_word(saying, num)
  saying[0..(num-1)] 
end

def first_word(phrase)
  phrase.split[0]
end

# titlecase is method of Linguistics gem
def titleize(title) 
  title.en.titlecase
end