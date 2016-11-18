require_relative './commands/place'
require_relative './commands/move'
require_relative './commands/report'
require_relative './commands/left'
require_relative './commands/right'

class ProcessorException < Exception; end

class Processor
  PLACE = :place
  MOVE = :move
  REPORT = :report
  LEFT = :left
  RIGHT = :right

  AVAIABLE_COMMANDS = [PLACE, MOVE, REPORT, LEFT, RIGHT]

  def execute(instruction)
    command, args = sanitize_instruction(instruction)

    if AVAIABLE_COMMANDS.include? command
      return command_map[command].new(self, args).run
    end

    raise ProcessorException, "The command #{command.upcase} is not avaiable"
  end

  def move
    raise NotImplementedError, "Subclasses must implement #move"
  end

  def place(x, y, facing)
    raise NotImplementedError, "Subclasses must implement #place"
  end

  def turn_right(facing)
    raise NotImplementedError, "Subclasses must implement #turn_right"
  end

  def turn_left(facing)
    raise NotImplementedError, "Subclasses must implement #turn_left"
  end

  def report
    raise NotImplementedError, "Subclasses must implement #report"
  end

  private
  def command_map
    @command_map ||= {
      PLACE => Commands::Place,
      MOVE => Commands::Move,
      REPORT => Commands::Report,
      LEFT => Commands::Left,
      RIGHT => Commands::Right
    }
  end

  def sanitize_instruction(instruction)
    command, args = instruction.split(' ')

    [command.downcase.to_sym, args]
  end
end
