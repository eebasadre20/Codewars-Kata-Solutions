# PROBLEM --> https://www.codewars.com/kata/directions-reduction/train/ruby
# Click the link for more information
# about the Kata problem.

require 'pry'

def dirReduc( arr )
  direction = DirectionReduction.new ( arr )
  direction.best_path
end

class DirectionReduction

  def initialize( direction )
    @direction = direction.compact
    @temp_direction = []
  end

  def best_path
    loop do
      direction_length = @direction.length
      x = 0

      # Iterate the list of direction
      # and check if the x ( index ) is pair
      # to the x + 1 ( index ), so , if yes
      # increment x to 2 to proceed to next index
      # else store the unmatch direction to the
      # temporary direction then increment x to 1
      # binding.pry
      while x <= direction_length - 1
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

      # if both temp direction and direction
      # are equal with length. Replace direction
      # value from temp direction value
      # then break to the loop
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

# Additional test:
u=["NORTH", "NORTH", "NORTH", "SOUTH"]
Test.assert_equals(dirReduc(u), ["NORTH", "NORTH"])

# when got nil inside the array
# but still return proper result
u=["NORTH", nil,"NORTH",nil, "NORTH", nil,"SOUTH",nil]
Test.assert_equals(dirReduc(u), ["NORTH", "NORTH"])