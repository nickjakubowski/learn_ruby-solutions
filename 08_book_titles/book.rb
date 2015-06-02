class Book	

attr_accessor :title

def title
  exclude = %w{a an the in of and but or nor at by for from in into of off on onto out over up with to as}
  a = @title.split
  a.map! do |word|
    if exclude.include? word
    word
    else
    word.capitalize
    end 
  end
  a[0].capitalize!
  a[-1].capitalize!
  a.join(" ")
end

end