require_relative 'processor'

class Robot < Processor
  attr_accessor :current_facing

  AVAIABLE_FACING = [:north, :east, :south, :west]
  STEP_SIZE = 1
  ROTATE_SIZE = 1

  def initialize(table)
    @table = table
  end

  def move
    @table.move_by_direction(STEP_SIZE, current_facing)
  end

  def report
    [@table.x, @table.y, current_facing.to_s].join(',').upcase
  end

  def place(x, y, facing)
    @current_facing = facing
    @table.set_place(x, y)
  end

  def turn_left(facing)
    @current_facing = facing
  end

  def turn_right(facing)
    @current_facing = facing
  end
end
