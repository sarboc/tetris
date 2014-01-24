require "pry"

class Board
  attr_accessor :rows

  attr_reader :full_row, :empty_row, :width, :height

  def initialize(width, height)
    @width = width
    @height = height

    @full_row = ""
    width.times { @full_row += "X" }

    @empty_row = ""
    width.times { @empty_row += " " }

    @rows = []
    height.times { @rows << @empty_row }
  end

  def check_rows
    @rows.delete(@full_row)
    until @rows.length == @height
      @rows << @empty_row
    end
  end

  def place(piece)
    current_rotation = piece.positions[piece.current_rotation]

    piece_width = current_rotation[0].length
    piece_height = current_rotation.length
    positions_to_check = []

    piece_height.times do |y_value|
      piece_width.times do |x_value|
        positions_to_check << [x_value, y_value]
      end
    end

    # binding.pry
    lowest_valid_row = @height - piece_height

    lowest_valid_row.downto(0) do |y|
      valid = true

      positions_to_check.each do |coords|

        board_x = coords[0] + piece.x_position
        board_y = coords[1] + y

        if @rows[board_y][board_x] == "X" && current_rotation[coords[1]][coords[0]] == "X"
          valid = false
          break
        end

      end

      if valid
        lowest_valid_row = y
      end

    end # end downto

    positions_to_check.each do |coords|
      board_x = coords[0] + piece.x_position
      board_y = coords[1] + lowest_valid_row
      @rows[board_y][board_x] = current_rotation[coords[1]][coords[0]]
    end
  end # end place method

end