require 'pry'

class Node
  attr_accessor :data, :next

  def initialize( data )
    @data = data
    @next = nil
    @count = 0
  end

  def count( node, attribute )
    @count = @count + 1 if !node.nil? && !node.next.nil? && node.next.data == attribute 
    count( node.next, attribute ) if !node.nil? && !node.next.nil?
    
    @count
  end
end

def count( node, attribute )
  node.count( node, attribute ) 
end

n1 = Node.new( "Hello" )
n2 = Node.new( "World" )
n3 = Node.new( "!" )
n4 = Node.new( "!" )
n5 = Node.new( "!" )

n1.next = n2
n1.next.next = n3
n1.next.next.next = n4
n1.next.next.next.next = n5

puts count( n1, "!" )

