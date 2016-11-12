require 'pry'

class Node
  attr_accessor :data, :next
  def initialize(data)
    @data = data
    @next = nil
    @len = 1
    @len_count = 0
  end

  def length
    count(self)
  end

  def repeated_num( num )
    repeated( self, num )
  end

  private

  def count(node)
    if !node.nil? && !node.next.nil?
      @len = @len + 1
        count(node.next)
    end
    @len
  end

  def repeated( node, num )
    @len_count = @len_count + 1 if !node.nil? && !node.next.nil? && node.next.data == num
    repeated( node.next, num ) if !node.nil? && !node.next.nil?
    @len_count
  end
end

def length( node )
  node.length
end

def count( node, num )
  node.repeated_num( num )
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