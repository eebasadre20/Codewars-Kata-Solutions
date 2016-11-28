require 'pry'

class Node
  attr_accessor :data, :next, :num_count

  def initialize( data )
    @data = data
    @next = nil
    @num_count = 0
  end

  def count( num, options = {} )
    node = !options[:node].nil? ? options[:node] : self
    num_count = num_count + 1 if !self.nil? && !node.next.nil? && node.next.data == num 
    count( num, node: self.next ) if !node.nil? && !node.next.nil?
    
    return num_count
  end
end
