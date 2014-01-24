require "spec_helper"
require_relative "../board"
require_relative "../piece"

describe Board do
  let(:width) { rand(4..20) }
  let(:height) { rand(4..20) }
  let(:board) { Board.new(width, height) }
  let(:piece) { PieceO.new(board.width) }

  describe "initialize" do
    it "should have a width" do
      board.should respond_to(:width)
      board.width.should == width
    end

    it "should have a height" do
      board.should respond_to(:height)
      board.height.should == height
    end

    it "should have a full row equal to the width" do
      board.should respond_to(:full_row)
      board.full_row.length.should == width

      full_row = ""
      width.times { full_row += "X" }
      board.full_row.should == full_row
    end

    it "should have rows" do
      board.should respond_to(:rows)
    end

    it "should have [height] rows" do
      board.rows.length.should == height
    end

    it "should have [width] spaces in each row" do
      board.rows.first.length.should == width
    end
  end

  describe "check rows" do
    it "should remove all rows that match the full row" do
      board.rows[0] = board.full_row
      board.rows.include?(board.full_row).should be_true

      board.check_rows
      board.rows.include?(board.full_row).should be_false
    end

    it "should add blank rows to match the height" do
      board.rows[0] = board.full_row
      board.check_rows
      board.rows.length.should == height
    end
  end

  describe "place" do
    it "should add the piece to the board" do
      board.place(piece)
      board.rows[0][0].should == "X"
      board.rows[0][1].should == "X"
      board.rows[1][0].should == "X"
      board.rows[1][1].should == "X"
    end

    it "should add the piece to the proper column (x value)" do
      piece.move("right")
      piece.move("right")
      board.place(piece)
      board.rows[0][0].should == " "
      board.rows[1][1].should == " "
      board.rows[0][2].should == "X"
      board.rows[1][3].should == "X"
    end

    it "should be able to travel through a row with an opening big enough"

    it "should be stopped by an almost complete row with no opening large enough for the piece"

    it "should raise an error if there is no valid y value in the current column"

  end

end