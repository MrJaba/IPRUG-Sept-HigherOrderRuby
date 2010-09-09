#Practical example - calculating Square Roots using the Newton Raphson method
#Streams to represent Approximate Calculations

#Generate a stream where function is applied to each element
def iterate_function(start_value, function)
  Node.new(start_value, lambda{ iterate_function( function.call(start_value), function ) })
end

def sqrt_stream(n)
  iterate_function(n, lambda{|g| (g*g + n ) / (2*g) }) #Function to improve the guess by calculating the intersection of the x axis of the tangent line
end

#to solve for √2
sqrt_2 = sqrt_stream(2.0)
limit = 10
while( sqrt_2 && limit > 0 ) do
  limit -=1
  puts sqrt_2.drop
end
