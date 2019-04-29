relative_require("./piece.rb")

class Board

  attrreader :
  @@boardPositions

  #initialize board
  def initialize()
    @@boardPositions = setup_board
  end

  def move_piece(start_pos, end_pos)
    raise RuntimeError unless @@boardPosition[start_pos] != nil
    raise RuntimeError unless @@boardPosition[end_pos] == nil
    @@boardPositions[start_pos], @@boardPositions[end_pos] = @@boardPositions[end_pos], @@boardPoistions[start_pos]
  end


  Private
  @@spacesInRow = 8

  def setup_board()
    tempBoardPositions = [@@spacesInRow]
    pieceRows = [0,1,6,7]
    (0...@@spacesInRow).each do |idx|
      newRowArr = []
      if pieceRows.includes?(idx)
        @@spacesInRow.times { newRowArr << Piece.new }
      else
        @@spacesInRow.times { newRowArr << nil }
      end
      tempBoardPositions[idx] << newRowArr
    end
    tempBoardPositions
  end

end
