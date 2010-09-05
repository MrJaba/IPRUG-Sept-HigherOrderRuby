#More complex examples of transforming steams and filtering them
require 'node'

#To transform all the elements of a stream
def transform(stream, function)
  Node.new( function.call(stream.head), lambda{ transform( stream.tail, function ) } )
end

def upfrom(start)
  Node.new( start, lambda{ upfrom(start+1) } )
end

#Give me all the even numbers
evens = transform( upfrom(1), lambda{|x| x * 2 } )

# while( evens ) do
#   puts evens.drop
# end


#To filter elements of a stream
def filter(stream, function)
  until( stream.nil? || function.call(stream.head) ) do
    stream.drop
  end
  return if stream.nil? #Give up if we found nothing of interest
  Node.new( stream.head, lambda{ filter(stream.tail, function) } )
end

def string_sequence(start)
  Node.new( start, lambda{ string_sequence(start.next) } )
end

only_a = filter( string_sequence("a"), lambda{|val| val =~ /a/ } )

while( only_a ) do
  puts only_a.drop
end