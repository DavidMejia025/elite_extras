#1. Tomar una cadena de 81 caracteres y convertirla en un matriz de 9 x 9.
#2. Verificar las opciones que hay en algún espacio en blanco.
#3. Solucionar el sudoku (recursivamente).
#4 ¿Es útil la programación dinámica en este ejercicio?
#
#Sample boards can be found here:
#http://sudopedia.enjoysudoku.com/Invalid_Test_Cases.html

def sudoku(str)
  board = str_to_matrix(str)

  return false unless valid_solution?(board)

  nums = (1..board.length).map {|num| num.to_s}

  return board if board_done?(board)

  result = solve_sudoku(nums, board)
end

def valid_solution?(board)
  for i in 0..(board.length) - 1 do
    return false if valid_insertion?(board,i,i) == false
  end

  true
end

def solve_sudoku(nums, board)
   unless find_new_space(board)
p "Solution:"
     board. each{|row| p row}
p    board.join("")
     return true
   end

  row_col = find_new_space(board)

  candidates = find_candidates(nums, board, row_col[0], row_col[1])

  return false if candidates.empty?

  result = candidates.map do |candidate|
    new_board = add_candidate(board * 1, row_col[0], row_col[1], candidate)

    return true  if solve_sudoku(nums, new_board) == true
  end

  return false
end

def add_candidate(board, row, column, candidate)
  new_board              = board.map(&:clone)
  new_board[row][column] = candidate

  new_board
end

def find_new_space(board)
  for i in 0..(board.length) - 1 do
    for j in 0..(board.length) -1 do
     return i, j  if board[i][j] == "."
    end
  end

  return false
end

def find_candidates(nums, board, row, column)
  box    = get_box(board, row, column)
  row    = board[row]
  column = get_column(board, column)

  row_candidates    = nums - row
  column_candidates = nums - column
  box_candidates    = nums - box

  pre_candidates = row_candidates.map {|row_element| column_candidates.select {|num| row_element == num}}.flatten

  box_candidates.map {|box_element| pre_candidates.select {|num| box_element == num}}.flatten
end

def board_done?(board)
  board.map {|row| return false unless row.select {|element| element == "." }.empty?}

  true
end

def valid_insertion?(board, row, column)
  return false unless valid_row?(board, row)
  return false unless valid_column?(board, column)

  true
end

def valid_row?(board, row)
  duplicates = 0

  for i in 0..((board.length) - 1) do
    if board[row][i] != "."
      duplicates =  board[row].select {|num| board[row][i] == num }.count
    end

    return false if duplicates > 1
  end

  true
end

def get_box(board, row, column)
   if row < 3
     case column
     when 0..2
       box_indexes = [0, 0]
     when 3..5
       box_indexes = [0, 3]
     when 6..8
       box_indexes = [0, 6]
     end
   elsif row <6
     case column
     when 0..2
       box_indexes = [3, 0]
     when 3..5
       box_indexes = [3, 3]
     when 6..8
       box_indexes = [3, 6]
     end
   else
     case column
     when 0..2
       box_indexes = [6, 0]
     when 3..5
       box_indexes = [6, 3]
     when 6..8
       box_indexes = [6, 6]
     end
   end

   k        = 0
   box      = []
   row_0    = box_indexes[0]
   column_0 = box_indexes[1]

   for i in row_0..row_0+2 do
     for j in column_0..column_0+2 do
       box[k] = board[i][j]

       k += 1
     end
   end

   box
end

def get_column(board, column)
  column_vector = []

  for i in 0..((board.length) - 1) do
    column_vector.push(board[i][column])
  end

  column_vector
end

def valid_column?(board, column)
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

#"unsolvable from the begining"
str0 = "5123456789......................................................................."
str1 = ".5123456789......................................................................"
#"unsolvable"
str2 = "..9.287..8.6..4..5..3.....46.........2.71345.........23.....5..9..4..8.7..125.3.."
str2 = "6.159.....9..1............4.7.314..6.24.....5..3....1...6.....3...9.2.4......16.."
str21 = "..9.7...5..21..9..1...28....7...5..1..851.....5....3.......3..68........21.....87"
str22 = ".4.1..35.............2.5......4.89..26.....12.5.3....7..4...16.6....7....1..8..2."
#"solvable"
str3 = "5..6.....8275.....6..831..5..24...87......4.2..4..8..6.9.1.7...21...67...53.....9"
str4 = ".39...12....9.7...8..4.1..6.42...79...........91...54.5..1.9..3...8.5....14...87."
str5 = "783.....6...98..2.9426..7..45...6............1.9.5.47.....25.4.6...785..........."

p sudoku(str0)
p sudoku(str1)
p sudoku(str2)
p sudoku(str21)
p sudoku(str22)
p sudoku(str3)
p sudoku(str4)
p sudoku(str5)
p sudoku(str6)
