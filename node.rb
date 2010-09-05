class Node
  attr_reader :head
  def initialize(head, tail=nil)
    @head, @tail = head, tail
  end
  
  def tail
    @tail.instance_of?(Proc) ? @tail.call : @tail
  end  
  
  #convenience method for a.head && a = a.tail
  #returns current value and replaces itself with the next item in list
  def drop
    head = @head
    @head = tail.head
    @tail = tail.instance_variable_get("@tail")
    head
  end
end
