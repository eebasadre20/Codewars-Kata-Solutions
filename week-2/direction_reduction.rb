require 'pry'

def dirReduc( arr )
  direction = DirectionReduction.new ( arr )
  direction.best_path
end

class DirectionReduction

  def initialize( direction )
    @direction = direction
    @temp_direction = []
  end

  def best_path
    loop do
      direction_length = @direction.length
      x = 0

      while x < direction_length - 1
        if ( @direction[x] == 'NORTH' && @direction[x + 1] == 'SOUTH' ) ||
           ( @direction[x] == 'SOUTH' && @direction[x + 1] == 'NORTH' ) ||
           ( @direction[x] == 'EAST' && @direction[x + 1] == 'WEST' )   ||
           ( @direction[x] == 'WEST' && @direction[x + 1] == 'EAST'  )

            x = x + 2
        else
          @temp_direction << @direction[x]
          x = x + 1
        end
      end

      if x < direction_length
        @temp_direction << @direction[x]
        x = x + 1
      end

      if @direction.length == @temp_direction.length
        @direction = @temp_direction
        @temp_direction = []
        break
      end

      @direction = @temp_direction
      @temp_direction = []
    end

    @direction
  end
end

arr = dirReduc(  ["NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST"] )

puts "RETURN IS: #{arr}"