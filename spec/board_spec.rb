require "spec_helper"
require_relative "../board"

describe Board do
  let(:width) { rand(4..20) }
  let(:height) { rand(4..20) }
  let(:board) { Board.new(width, height) }

  describe "initialize" do
    it "should have a width" do
      board.should respond_to(:width)
      board.width.should == width
    end

    it "should have a height" do
      board.should respond_to(:height)
      board.height.should == height
    end

    it "should have a full space marker" do
      board.should respond_to(:full_space_marker)
    end

    it "should have a full row equal to the width" do
      board.should respond_to(:full_row)
      board.full_row.length.should == width

      marker = board.full_space_marker
      full_row = ""
      width.times { full_row += marker }
      board.full_row.should == full_row
    end

    it "should have an empty row equal to the width" do
      board.should respond_to(:empty_row)

      blank = ""
      width.times { blank += " " }
      board.empty_row.should == blank
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

end