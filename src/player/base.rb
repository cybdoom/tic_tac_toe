module Player

  class Error < RuntimeError; end
  class UnknownPlayerType < Error; end

  class Base

    attr_reader :name, :chip

    def initialize(name, chip)
      @name = name
      @chip = chip
    end

    def get_input
      raise UnknownPlayerType
    end

    def to_s
      @name
    end

    def ask_for_move
      STDOUT.puts "#{self}: make your move!"
    end

  end

end
