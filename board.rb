require "pry"

class Board
  attr_accessor :rows

  attr_reader :full_row, :empty_row, :width, :height

  def initialize(width, height)
    @width = width
    @height = height

    @full_row = ""
    width.times { @full_row += "X" }

    @rows = []

    height.times do
      string = ""
      width.times do
        string += " "
      end
      @rows << string
    end

  end

  def check_rows
    # delete any full rows
    @rows.delete(@full_row)

    # add blank rows back to the array until we're back to proper height
    until @rows.length == @height
      string = ""
      width.times do
        string += " "
      end
      @rows << string
    end
  end

  def place(piece)
    current_rotation = piece.positions[piece.current_rotation]

    # create an array of all the indexes we'll need to check
    positions_to_check = []
    current_rotation.length.times do |y_value|
      current_rotation[0].length.times do |x_value|
        positions_to_check << [x_value, y_value]
      end
    end

    # the highest point we could possible place a piece is the height of the board minus the height of the piece
    lowest_valid_row = @height - current_rotation.length

    # check all rows to see if the piece could be placed there
    lowest_valid_row.downto(0) do |y|
      # keep track of if the move is valid
      valid = true

      # for each row, check the coordinates of each square of the board and the piece
      positions_to_check.each do |coords|

        # the board x to check is the current x coordinate, plus the x value of the piece
        # the board y to check is the current y coordinate, plus the y of the row we are current checking
        board_x = coords[0] + piece.x_position
        board_y = coords[1] + y

        # all combinations except an "X" on the board and an "X" in the array are acceptable
        # a blank square can combine with an "X", and two blanks can combine
        # if we hit two X's, the move is not valid
        if @rows[board_y][board_x] == "X" && current_rotation[coords[1]][coords[0]] == "X"
          valid = false
          break
        end

      end

      # if valid move, update our lowest_valid_row to the current row number
      if valid
        lowest_valid_row = y
      end

    end # end downto

    # once we have the lowest row, make updates to the board
    positions_to_check.each do |coords|
      board_x = coords[0] + piece.x_position
      board_y = coords[1] + lowest_valid_row
      @rows[board_y][board_x] = current_rotation[coords[1]][coords[0]]
    end

  end # end place method

end