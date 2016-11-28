require 'pry'

class Node
  attr_accessor :data, :next, :len

  def initialize( data )
    @data = data
    @next = next
    @len = 0
  end

  def length( node )
    if !node.nil? && !node.next.nil?
      len = len + 1
      length( node.next )
    end

    return len
  end
end
