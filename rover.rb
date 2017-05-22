# _ _ _ _ _ _ _ _ _
# 9|_|_|_|_|_|_|_|_|_|        N
# 8|_|_|_|_|_|_|_|_|_|      W   E
# 7|_|_|_|_|_|_|_|_|_|        S
# 6|_|_|_|_|_|_|_|_|_|
# 5|_|_|_|_|_|_|_|_|_|
# 4|_|_|_|_|_|_|_|_|_|
# 3|_|_|_|_|_|_|_|_|_|
# 2|_|_|_|_|_|_|_|_|_|
# 1|_|_|_|_|_|_|_|_|_|
# 0 1 2 3 4 5 6 7 8 9
#
# In order to control a rover, NASA sends a string of letters. The possible letters are 'L', 'R' and 'M'.
#
# 'L' and 'R' makes the rover spin 90 degrees left or right respectively, without moving from its current spot.
# 'M' means move forward one grid point, and maintain the same heading.

# Start by creating a Rover class that has these properties. Given that each rover starts with a location and direction, perhaps it's a
# good idea to have an initialize method for each rover that accepts these parameters.
# Next up we'll need to think about behaviour. Behaviours have the ability to read and affect the state of an object. We express those as methods.
# read_instruction should accept an instruction and decide whether to tell the rover to move or turn. It simply delegates to more specific behaviour.
# move affects the position of the rover. Depending on current direction and position, you'll need to update the x or y coordinates.
# turn affects the direction of the rover. Depending on the current direction of the rover, the new direction will be determined with either turning L or R.
# Once you've figured out how to move and turn your rover, the rest gets much easier because you got the seemingly complex stuff out of the
# way first! All you'll need to figure out from here is how to read and split up the instructions so that you can pass them on to your rovers.

class Rover

  attr_accessor :x_position, :y_position, :direction

  def initialize(x_position, y_position, direction)
    @x_position = x_position
    @y_position = y_position
    @direction = direction
  end

  def read_instruction #should accept an instruction and decide whether to tell the rover to move or turn.
  end

  def turn_left
    if @direction == "N"
      @direction = "W"
    elsif @direction == "W"
      @direction = "S"
    elsif @direction == "S"
      @direction = "E"
    elsif @direction == "E"
      @direction = "N"
    end
  end

  def turn_right
    if @direction == "N"
      @direction = "E"
    elsif @direction == "E"
      @direction = "S"
    elsif @direction == "S"
      @direction = "W"
    elsif @direction == "W"
      @direction = "N"
    end
  end



end

rover1 = Rover.new


# ###################################
# Test Input 1:
# 1 2 N                > our start position and direction
# LMLMLMLMM            > a series of move and turn instructions.
#
# Expected Output:
# 1 3 N                > rover's new position
#
#
# Test Input 2:
# 3 3 E
# MMRMMRMRRM
#
# Expected Output:
# 5 1 E
