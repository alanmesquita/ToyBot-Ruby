require_relative './base'

module Commands
  class Move < Base
    def run
      @robot.move
    end
  end
end
