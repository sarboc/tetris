require "pry"

class Piece

  attr_reader :x_position, :positions, :current_rotation, :board_width, :max_x

  def initialize(board_width)
    @board_width = board_width

    # since indexes start at 0, let's save some trouble and start our x_position at 0
    @x_position = 0

    # the index of the current rotation position; stored to make it easier to rotate later
    @current_rotation = 0
  end

  def move(direction)
    # set our change to 1 if moving right, -1 if moving left
    change = direction == "right" ? 1 : -1

    new_x = @x_position + change

    unless new_x < 0 || new_x > @max_x
      @x_position = new_x
    else
      raise "You've reached the end of the board!"
    end
  end

  def rotate

  end

  def update_max_x
    # make sure we can't fall off the edge of the board
    @max_x = @board_width - @positions[@current_rotation].length
  end

end

class PieceI < Piece

  def initialize(board_width)
    super
    @positions = [ ["XXXX"],
                   ["X",
                    "X",
                    "X",
                    "X"] ]
  end

end

class PieceO < Piece

  def initialize(board_width)
    super
    @positions = [ ["XX",
                    "XX"] ]
    update_max_x
  end

end