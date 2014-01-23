require "pry"

class Board
  attr_accessor :rows

  attr_reader :full_space_marker, :full_row, :empty_row, :width, :height

  def initialize(width, height)
    @width = width
    @height = height

    @full_space_marker = "X"
    @full_row = ""
    width.times { @full_row += @full_space_marker }

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

end