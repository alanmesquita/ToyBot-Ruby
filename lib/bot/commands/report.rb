require_relative './base'

module Commands
  class Report < Base
    def run
      @robot.report
    end
  end
end
