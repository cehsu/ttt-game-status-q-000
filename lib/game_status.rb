WIN_COMBINATIONS=[
  [0,1,2],  # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # ETC, an array for each win combination
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]
# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

def empty?(board)
  board.each do |position|
    if (position=="X"||position=="O")
      return false
    end
  end
end

def full?(board)
  return (draw?(board))
end

def draw?(board)
WIN_COMBINATIONS.each do |combination|
    if(board[combination[0]]=="X"&&board[combination[1]]=="X"&&board[combination[2]]=="X")
      return false
    elsif(board[combination[0]]=="O"&&board[combination[1]]=="O"&&board[combination[2]]=="O")
      return false
    end
  end
  board.each do |position|
    if (position == " "||position == ""||position==nil)
      return false
    end
  end
  return true
end


def over?(board)
  if(!(draw?(board))&&(!(won?(board))))
    return false
  else
    return draw?(board)||won?(board)
    end
end

def winner(board)
  if (!(won?(board)))
    return nil
  elsif (won?(board))
    return board[won?(board)[0]]
  end
end

def won?(board)

  if (empty?(board))
    return false
  end
  if (draw?(board))
    return false
  end
# Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS.each do |combination|
    if(board[combination[0]]=="X"&&board[combination[1]]=="X"&&board[combination[2]]=="X")
      return combination
    elsif(board[combination[0]]=="O"&&board[combination[1]]=="O"&&board[combination[2]]=="O")
      return combination
    end
  end

end