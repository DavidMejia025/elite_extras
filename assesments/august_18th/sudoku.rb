#1. Tomar una cadena de 81 caracteres y convertirla en un matriz de 9 x 9.
#2. Verificar las opciones que hay en algún espacio en blanco.
#3. Solucionar el sudoku (recursivamente).
#4 ¿Es útil la programación dinámica en este ejercicio?
#
#Caso válido:
#"5..6.....8275.....6..831..5..24...87......4.2..4..8..6.9.1.7...21...67...53.....9"
#
#Casos inválidos:
#http://sudopedia.enjoysudoku.com/Invalid_Test_Cases.html
#
def sudoku(str)
  board = str_to_matrix(str)

  nums = (1..board.length).map {|num| num.to_s}
p nums
  return board if board_done?(board)

p  result = solve_sudoku(nums, board)
p "1"
 p result
end

def valid_solution(str)
  board = str_to_matrix(str)

  for i in 0..(board.length) - 1 do
    return false if valid_insertion(board,i,i) == false
  end

  true
end

def solve_sudoku(nums, board)
   unless find_new_space(board)
     p "enddddddd"
     board. each{|row| p row}
     p board.join("")
     return true
   end

  row_col = find_new_space(board)

  candidates  = find_candidates(nums, board, row_col[0], row_col[1])

  return false if candidates.empty?

  result = candidates.map do |candidate|
    new_board = add_candidate(board * 1, row_col[0], row_col[1], candidate)
p candidate
    return true if solve_sudoku(nums, new_board) == true
  end

  return false
end

def add_candidate(board, row, column, candidate)
  new_board =  board.map(&:clone)

  new_board[row][column] = candidate


  new_board
end

def find_new_space(board)
  for i in 0..(board.length) - 1 do
    for j in 0..(board.length) -1 do
     return i, j  if board[i][j] == "."
    end
  end
p "done"
  return false
end

def find_candidates(nums, board, row, column)
  row    = board[row]
  column = get_column(board, column)

  row_candidates    = nums - row
  column_candidates = nums - column

  row_candidates.map {|row_element| column_candidates.select {|num| row_element == num}}.flatten
end

def board_done?(board)
  board.map {|row| return false unless row.select {|element| element == "." }.empty?}

  true
end

def valid_insertion(board, row, column)
  return false unless valid_row(board, row)
  return false unless valid_column(board, column)

  true
end

def valid_row(board, row)
  for i in 0..((board.length) - 1) do
    if board[row][i] != "."
      duplicates =  board[row].select {|num| board[row][i] == num }.count
    end

    return false if duplicates > 1
  end
  true
end

def get_column(board, column)
  column_vector = []

  for i in 0..((board.length) - 1) do
    column_vector.push(board[i][column])
  end

  column_vector
end

def valid_column(board, column)
  column_vector = get_column(board, column)

  duplicates = 0

  for i in 0..((board.length) - 1) do
    if column_vector[i] != "."
      duplicates =  column_vector.select {|num| column_vector[i] == num }.count
    end

    return false if duplicates > 1
  end
  true
end

def str_to_matrix(str)
  row_number = Math.sqrt(str.length)

  return "wrong size of sudoku" unless row_number % 1 == 0.0

  board = []
  row   = []
  k     = 0

  for i in 0..row_number - 1 do
    for j in 0..row_number -1 do
      row.push(str[k])
      k += 1
    end
    board.push(row)
    row = []
  end

  board
end

str = "5..6.....8275.....6..831..5..24...87......4.2..4..8..6.9.1.7...21...67...53.....9"
str = ".39...12....9.7...8..4.1..6.42...79...........91...54.5..1.9..3...8.5....14...87."
str = "783.....6...98..2.9426..7..45...6............1.9.5.47.....25.4.6...785..........."


str = ".9.3....1....8..46......8..4.5.6..3...32756...6..1.9.4..1......58..2....2....7.6."
str = "..........................................................................11....."
#"unsolvable"
#str = "..9.287..8.6..4..5..3.....46.........2.71345.........23.....5..9..4..8.7..125.3.."
#p valid_solution(sol)
p sudoku(str)
