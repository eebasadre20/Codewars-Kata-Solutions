# PROBLEM --> https://www.codewars.com/kata/reversi-row-rudiments/train/ruby
# Click the link for more information
# about the Kata problem.

require 'pry'

def reversi_row( moves )
  ReversiRowRudiments.new( moves ).do_the_moves
end

class ReversiRowRudiments
  attr_accessor :moves

  def initialize( moves )
    @moves = moves
    @player = true
    @_moves = ['.','.','.','.','.','.','.','.']
  end

  def do_the_moves
    evaluate_moves( moves )
    return @_moves.join( "" )
  end

  def evaluate_moves( moves )
    x = 0
    while( x < moves.length )

      # do the next iteration
      if @_moves[moves[x]] != '.'
        x = x + 1
        next
      end

      # player 1 if player == true
      # player 2 if player == false
      # change either '*' or 'O' if left and right element is true

      if @player
        @_moves[moves[x]] = '*'
        @_moves[moves[x] - 1] = '*' if left_element?( moves[x], '*' )
        @_moves[moves[x] + 1] = '*' if right_element?( moves[x], '*' )
        @player = false
      else
        @_moves[moves[x]] = 'O'
        @_moves[moves[x] - 1] = 'O' if left_element?( moves[x], 'O' )
        @_moves[moves[x] + 1] = 'O' if right_element?( moves[x], 'O' )
        @player = true
      end

      x = x + 1
    end
  end

  private

  # checking left elements of the current position
  def left_element?( position, symbol )
    @_moves[position - 2] == symbol && @_moves[position - 1] != '.' if position > 1
  end

  # checking right elements of the current position
  def right_element?( position, symbol )
    @_moves[position + 2] == symbol && @_moves[position + 1] != '.' if position < 7
  end
end

# puts reversi_row([])
# puts reversi_row([3])
# puts reversi_row( [3, 4] )
# puts reversi_row([3, 4, 5])

puts reversi_row( [0, 1, 7, 2, 3] )
