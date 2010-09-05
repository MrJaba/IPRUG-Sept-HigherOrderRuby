#Ruby 1.8

def scale_number(x, factor)
  x * factor 
end
  
def scale_factory(factor)
  lambda{|x| x * factor} 
end

scale_3 = scale_factory(3)

1.upto(10) do |x|
  puts scale_number(x, 3)
end

1.upto(10) do |x|
  puts scale_3.call(x)
end

#Ruby 1.9

# scale = lambda{|factor, x| x * factor }
# scale_3 = scale.curry[3]
# 
# 1.upto(10) do |x|
#   puts scale_3.call(x)
# end

#Curried Map function

#before
p (1..10).to_a.map {|x| x * 2}
#cant pass this around and use anywhere else

#after
def cmap(&block)
  lambda{|array| return array.map(&block) } 
end
#this can be reused elsewhere to double any stream of numbers

map_double = cmap {|x| x * 2 }
p map_double.call((1..10).to_a)
