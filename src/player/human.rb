require_relative './base'

module Player

  class Human < Base

    def get_input
      STDIN.readline.strip
    end

  end

end
