class Array

attr_accessor :sum, :square	

def sum
  self.inject(0) {|sum, dig| sum + dig}
end	

def square
  self.map {|val| val **2}
end	

def square!
  self.map! {|val| val**2}
end	

end