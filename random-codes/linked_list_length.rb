require 'pry'

class Node
  attr_accessor :data, :next

  def initialize( data )
    @data = data
    @next = nil 
    @len = 0
  end

  def length
    dig( self ) 
  end

  private

  def dig( node )
    if !node.nil? && !node.next.nil?
      @len = @len + 1
      dig( node.next )
    end

    @len
  end
end


def length( node )
  node.length 
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

puts length( n1 )
