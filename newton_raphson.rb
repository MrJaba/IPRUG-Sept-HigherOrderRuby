#Practical example - calculating Square Roots using the Newton Raphson method
#Streams to represent Approximate Calculations
require 'rubygems'
require 'ruby-debug'
require 'node'

def solve(initial_guess, function)
  debugger
  iterate_function(initial_guess, lambda{ |g| (g - function.call(g)) / slope(g,function) } )  
end

#Generate a stream where function is applied to each element
def iterate_function(start_value, function)
  Node.new(start_value, lambda{ iterate_function( function.call(start_value), function ) })
end

#From previous example
def transform(stream, function)
  ns = stream
  Node.new( function.call(ns.head), lambda{ transform( ns.tail, function ) } )
end

#calculating slope of a tagent line on a curve - called the derivative function
def slope(x,function)
  point_difference = 0.00000095367431640625
  (function.call(x+point_difference) - function.call(x-point_difference)) / (2*point_difference)
end

#to solve for √2
#so (x * x) - 2 = 0
sqrt_2 = solve(1, lambda{|x| x * x - 2.0 })

while( sqrt_2 ) do
  puts sqrt_2.drop
end
