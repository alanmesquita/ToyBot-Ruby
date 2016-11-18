require_relative './base'

module Commands
  class Place < Base
    def run
      x, y, facing = sanitize_args

      @robot.place(x, y, facing)
    end

    protected
    def validate
      if not param_is_valid?
        raise(
          CommandsException,
          "The param #{@args} is invalid. Send a pattern like: 0,0,NORTH"
        )
      end
    end

    private

    # Check if the args send is valid using the robot avaiable facings
    #
    # Validates the pattern example:
    #   0,0,NORTH
    #   10,5,SOUTH
    def param_is_valid?
      robot_facings = @robot.class.const_get(:AVAIABLE_FACING).map(&:to_s)

      !(@args =~ /^\d+,\d+,(#{robot_facings.join('|').upcase})+$/).nil?
    end

    def sanitize_args
      x, y, facing = @args.split(',')

      [x.to_i, y.to_i, facing.downcase.to_sym]
    end
  end
end
