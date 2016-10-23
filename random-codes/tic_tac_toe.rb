require 'matrix'
require 'pry'

class Board
  attr_accessor :board

  def init_board
    board = [
              [0,0,0],
              [0,0,0],
              [0,0,0]
            ]
  end
end

tic_tac_toe = Board.new
puts tic_tac_toe.init_board