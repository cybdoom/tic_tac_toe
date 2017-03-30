class Field

  class Error < RuntimeError; end
  class NotEmptyCell < Error; end
  class OutOfBounds < Error; end

  WALL_SYMBOL = "#"

  attr_reader :size

  def initialize(size)
    @size = size
    spawn_cells
  end

  def [](point)
    @cells[point]
  end

  def []=(point, chip)
    @cells[point] = chip
  end

  def valid_move?(point)
    return true if @cells[point] == ' '

    raise OutOfBounds if point[0] < 0 || point[0] > @size - 1 ||
                         point[1] < 0 || point[1] > @size - 1

    raise NotEmptyCell
  end

  def print
    STDOUT.puts
    (@size + 2).times do |i|
      (@size + 2).times do |j|
        if i <= 0 || i >= @size + 1 || j <=0 || j >= @size + 1
          STDOUT.print WALL_SYMBOL
          STDOUT.puts if j >= @size + 1
        else
          STDOUT.print @cells[[j - 1, i - 1]]
        end
      end
    end
    STDOUT.puts
  end

  def clean
    @size.times do |i|
      @size.times do |j|
        @cells[[i, j]] = ' '
      end
    end
  end

  private

  def spawn_cells
    @cells = {}
    clean
  end

end
