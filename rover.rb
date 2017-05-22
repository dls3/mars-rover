# In order to control a rover, NASA sends a string of letters. The possible letters are 'L', 'R' and 'M'.
#
# 'L' and 'R' makes the rover spin 90 degrees left or right respectively, without moving from its current spot.
# 'M' means move forward one grid point, and maintain the same heading.

class Rover

  attr_reader :x_position, :y_position, :direction
  attr_accessor :read_instruction, :turn_left, :turn_right

  def initialize(x_position, y_position, direction)   #Starts with xy positions. Facing N/W/E/S
    @x_position = x_position
    @y_position = y_position
    @direction = direction
  end

  def read_instruction(inputs) #should accept an instruction and decide whether to tell the rover to move or turn
    @input = inputs.downcase.split(//)

    @input.each do |instruction|  #iterate through every instruction (letter) in the input
      if instruction == "M"
        move  #run move method
      elsif instruction == "B"
        move_back #run move_back method
      elsif instruction == "L"
        turn_left  #run turn_left method
      elsif instruction == "R"
        turn_right  #run turn_right method
      else
        puts "Not a valid command. Please enter 'M', 'L', or 'R'"
      end
    end

  end

  def turn_left
    puts "Turning left"
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
    puts "Turning right"
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

  def move
    puts "Moving forward one space"
    if direction == "N"
      @y_position += 1
    elsif direction == "E"
      @x_position += 1
    elsif direction == "S"
      @y_position -= 1
    elsif direction == "W"
      @x_position -= 1
    end
  end


  def move_back
    puts "Moving backward one space"
    if direction == "N"
      @y_position -= 1
    elsif direction == "E"
      @x_position -= 1
    elsif direction == "S"
      @y_position += 1
    elsif direction == "W"
      @x_position += 1
    end
  end

  def report
    puts "Your rover is at coordinates (#{@x_position}, #{@y_position}) and is facing #{@direction}"
  end

end

rover1 = Rover.new(1, 1, "N")

rover1.read_instruction("MMLRRLMRLM")
rover1.report


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
