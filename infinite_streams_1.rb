#Basic Example showing diffrence between a plain recursive stream - infinite memory and processing time VS a lazily evaluate stream which returns
#immediately

require 'node'

def upfrom(start)
  Node.new( start, lambda{ upfrom(start+1) } )
end

def upfrom_list(start)
  Node.new( start, upfrom_list(start+1) )
end

#b = upfrom_list(1) #StackLevelTooDeep
a = upfrom(1)

#Debug statement to iterate over the list
# while( a ) do
#   puts a.head
#   a = a.tail
# end

#Replaced with this
while( a ) do
  puts a.drop
end

