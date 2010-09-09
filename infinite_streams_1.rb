#Basic Example showing diffrence between a plain recursive stream - infinite memory and processing time VS a lazily evaluate stream which returns
#immediately

require 'node'

#AFTER
def upfrom_lazy(start)
  Node.new( start, lambda{ upfrom_lazy(start+1) } )
end

#BEFORE
def upfrom_recursive(start)
  Node.new( start, upfrom_recursive(start+1) )
end

#b = upfrom_recursive(1) #StackLevelTooDeep
a = upfrom_lazy(1)

#Debug statement to iterate over the list
while( a ) do
  puts a.drop
end

