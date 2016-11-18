require_relative './bot/robot'
require_relative './bot/table'

module Bot
  module_function

  def robot
    @robot ||= Robot.new(Table.new)
  end

  def run
    args = gets.chomp

    if args.empty?
      stdout_message 'You need to send a command'
      return run
    end

    run_flow(args)
  end

  def run_flow(args)
    begin
      robot_response = robot.execute args

      stdout_message(robot_response) if robot_response.kind_of?(String)
    rescue ProcessorException, TableException, CommandsException => e
      stdout_message e.message
    end

    run
  end

  def stdout_message(message)
    print "#{message}\n"
  end
end
