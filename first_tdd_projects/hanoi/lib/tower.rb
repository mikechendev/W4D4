class Tower
  attr_accessor :board
  
  def initialize
    @board = [
      [1, 2, 3],
      [:x, :x, :x],
      [:x, :x, :x]
    ]
    display
    # self.play
  end

  def [](pos)
    row, col = pos
    @board[row][col]
  end
  
  def []=(pos, value)
    row, col = pos
    @board[row][col] = value
  end
  
  def find_first_piece(col)
    pos = []
    @board[col].each_with_index do |space, idx|
      if space.is_a?(Integer)
        pos = [col, idx]
        break
      end
    end
    pos
  end

  def move(pos)
    col_1, col_2 = pos
    moving_x, moving_y = find_first_piece(col_1)
    moving_piece = @board[moving_x][moving_y]
    
    @board[col_2].each_with_index do |space, idx|
      if @board[col_2][idx+1].is_a?(Integer)
        @board[col_2][idx] = moving_piece
        @board[moving_x][moving_y] = :x
        return display
      end
    end
    
    @board[col_2][-1] = moving_piece
    @board[moving_x][moving_y] = :x
    return display
  end

  def valid_move?(pos)
    col_1, col_2 = pos
    raise "No piece in selected column!" if @board[col_1].all?(:x)
    
    movingpiece = 0
    stationarypiece = 100

    @board[col_1].each_with_index do |space, idx|
      if space.is_a?(Integer)
        movingpiece = space
        break
      end
    end

    @board[col_2].each_with_index do |space, idx|
      if space.is_a?(Integer)
        stationarypiece = space
        break
      end
    end

    return false if stationarypiece < movingpiece
    true
  end

  def play
    until win?
      puts "Enter your first and second position in the form of 0 2"
      player_move = gets.chomp.split.map(&:to_i)
      if valid_move?(player_move)
        move(player_move)
      else
        puts "Not a valid move - please enter another one."
      end
    end
      
    print "You win!"
  end

  def win?
    @board[1..-1].any? {|row| row.all? {|space| space.is_a?(Integer)}}
  end

  def display
    transposed = @board.transpose
    transposed.each do |row|
      p row
    end
  end
end