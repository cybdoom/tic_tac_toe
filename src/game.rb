class Game

  def initialize(field, players, match_to_win)
    @field = field
    @players = players
    @match_to_win = match_to_win

    @winner = nil
    @draw = false
    @turn = 0
  end

  def run
    loop do
      next_turn

      if end?
        show_result
        restart
      end
    end
  end

  private

  def end?
    @draw || !@winner.nil?
  end

  def show_result
    @field.print

    if @draw
      STDOUT.puts "This time it is draw :)"
    elsif !@winner.nil?
      STDOUT.puts "#{@winner} wins!!!"
    end
  end

  def next_turn
    @turn += 1

    loop do
      @field.print

      current_player.ask_for_move

      begin
        parse_input current_player.get_input
        break if @field.valid_move?(@last_move)
      rescue SystemExit
        exit
      rescue Exception => e
        STDOUT.puts "Invalid input. Try again, please"
        next
      end
    end

    @field[@last_move] = current_player.chip

    if win?
      @winner = current_player
    elsif @turn > @field.size ** 2
      @draw = true
    end
  end

  def restart
    STDOUT.puts "Restarting the game..."

    @field.clean
    @winner = nil
    @draw = false
    @turn = 0
  end

  def parse_input(input)
    case input
    when '!'
      STDOUT.puts "#{current_player} choose to quit. Goodbye!"
      exit
    when '@'
      STDOUT.puts "#{current_player} restarted the game. Good luck!"
      restart
    else
      @last_move = input.split.map {|str| Integer(str) }
    end
  end

  def win?
    match_line?(-1, 0, 1, 0) ||
    match_line?(0, -1, 0, 1) ||
    match_line?(1, 1, -1, -1) ||
    match_line?(-1, 1, 1, -1)
  end

  def match_line?(dx1, dy1, dx2, dy2)
    matches_in_ray(dx1, dy1) + matches_in_ray(dx2, dy2) + 1 >= @match_to_win
  end

  def matches_in_ray(dx, dy)
    matches = 0
    x, y = @last_move[0], @last_move[1]

    loop do
      break if (x + dx < 0 || x + dx > @field.size - 1) ||
               (y + dy < 0 || y + dy > @field.size - 1)

      x += dx
      y += dy

      if @field[[x, y]] == current_player.chip
        matches +=1
      else
        break
      end
    end

    matches
  end

  def current_player
    @players[(@turn - 1) % @players.count]
  end

end
