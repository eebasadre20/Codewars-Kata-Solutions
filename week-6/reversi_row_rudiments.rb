require 'pry'

def reversi_row( moves )
  ReversiRowRudiments.new( moves ).do_the_moves
end

class ReversiRowRudiments
  attr_accessor :moves
  @@_moves = ['.','.','.','.','.','.','.','.']
  @@player = true

  def initialize( moves )
    @moves = moves
  end

  def do_the_moves
    evaluate_moves( moves )
    return @@_moves.join( "" )
  end

  def evaluate_moves( moves )
    x = 0
    while( x < moves.length )
      if @@_moves[moves[x]] != '.'
        x = x + 1
        next
      end

      if ( left_element?( moves[x], '*' ) || right_element?( moves[x], '*' ) ) &&  @@player
        @@_moves[moves[x]] = '*'
        @@_moves[moves[x-1]] = '*'
        @@player = false
      elsif ( left_element?( moves[x], 'O' ) || right_element?( moves[x], 'O' ) )&& !@@player
        @@_moves[moves[x]] = 'O'
        @@_moves[moves[x-1]] = '*'
        @@player = true
      else
        if @@player
          @@_moves[moves[x]] = '*'
          @@player = false
        else
          @@_moves[moves[x]] = 'O'
          @@player = true
        end
      end

      x = x + 1
    end
  end

  private

  def left_element?( position, symbol )
    @@_moves[position - 2] == symbol  if position > 1
  end

  def right_element?( position, symbol )
    @@_moves[position + 2] == symbol  if position < 7
  end
end

puts reversi_row([])
puts reversi_row([3])
puts reversi_row( [3, 4] )
puts reversi_row([3, 4, 5])
