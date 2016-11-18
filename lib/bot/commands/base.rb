class CommandsException < Exception; end

class Base
  def initialize(robot, args = nil)
    @robot = robot
    @args = args

    validate
  end

  def run
    raise NotImplementedError, "Subclasses must implement #run"
  end

  protected
  def validate
    if @robot.current_facing.nil?
      raise CommandsException, 'Before some action you need to set a place'
    end
  end

  def get_avaiable_facing
    @avaiable_facing ||= @robot.class.const_get :AVAIABLE_FACING
  end

  def get_rotate_size
    @rotate_size ||= @robot.class.const_get :ROTATE_SIZE
  end
end
