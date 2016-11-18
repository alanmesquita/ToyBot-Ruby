require_relative './base'

module Commands
  class Left < Base
    def run
      current_facing = @robot.current_facing

      if not current_facing.nil?
        return @robot.turn_left get_previous_facing(current_facing)
      end
    end

    protected
    def get_previous_facing(current_facing)
      get_avaiable_facing.rotate(
        get_avaiable_facing.index(current_facing) - get_rotate_size
      ).first()
    end
  end
end
