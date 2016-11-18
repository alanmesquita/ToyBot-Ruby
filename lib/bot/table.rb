class TableException < Exception; end

INVALID_LOCATION_MESSAGE = "The robot can't move to this location"
WITHOUT_COORDS_MESSAGE = 'Before move the robot needs to have a location'
class Table
  attr_reader :x, :y

  def initialize(dimension_x = 5, dimension_y = 5)
    @dimension_x = Range.new(0, dimension_x)
    @dimension_y = Range.new(0, dimension_y)
  end

  def move_by_direction(step_size, direction)
    raise TableException, WITHOUT_COORDS_MESSAGE if @x.nil? or @y.nil?

    x, y = directions_move[direction].call(step_size)
    set_place(x, y)
  end

  def set_place(x, y)
    if valid_place?(x, y)
      @x, @y = x, y
      return
    end

    raise TableException, INVALID_LOCATION_MESSAGE
  end

  private
  def valid_place?(x, y)
    (@dimension_x).include?(x) and (@dimension_y).include?(y)
  end

  def directions_move
    @directions_move ||= {
      north: lambda { |step| [@x, @y + step] },
      south: lambda { |step| [@x, @y - step] },
      east:  lambda { |step| [@x + step, @y] },
      west:  lambda { |step| [@x - step, @y] }
    }
  end
end
