require "spec_helper"
require_relative "../piece"

describe Piece do
  let(:width) { rand(4..20) }
  let(:piece) { Piece.new(width) }

  describe "initialize" do
    it "should have an x coordinate" do
      piece.should respond_to(:x_position)
      piece.x_position == 0
    end

    it "should have an array of positions" do
      piece.should respond_to(:positions)
    end

    it "should have a current position" do
      piece.should respond_to(:current_rotation)
    end

    it "should know the board width" do
      piece.should respond_to(:board_width)
      piece.board_width.should == width
    end
  end

end

describe PieceO do
  let(:width) { rand(4..20) }
  let(:piece) { PieceO.new(width) }

  describe "initialize" do
    it "should have the same attributes as its super class" do
      piece.should respond_to(:x_position)
      piece.should respond_to(:positions)
      piece.should respond_to(:current_rotation)
      piece.should respond_to(:board_width)
    end

    it "should have 1 position" do
      piece.positions.length.should == 1
    end

    it "should set the max_x" do
      max_x = piece.board_width - piece.positions[piece.current_rotation].length
      piece.max_x.should == max_x
    end
  end

  describe "move" do
    it "should move to the right" do
      expect{piece.move("right")}.to change{piece.x_position}.by(1)
    end

    it "shouldn't move to the right past the max_x" do
      piece.max_x.times { piece.move("right") }
      expect{piece.move("right")}.to raise_error{RuntimeError}
    end

    it "should move to the left" do
      piece.move("right")
      expect{piece.move("left")}.to change{piece.x_position}.by(-1)
    end

    it "should not move to left past 0" do
      expect{piece.move("left")}.to raise_error{RuntimeError}
    end

  end


end

describe PieceI do
  let(:width) { rand(4..20) }
  let(:piece) { PieceI.new(width) }

  describe "initialize" do
    it "should have 2 positions" do
      piece.positions.length.should == 2
    end
  end

  describe "rotate" do
    it "should choose the next piece in the pieces array"

    it "should update the current rotation"
  end
end