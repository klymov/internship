# tasck_2 TicTacToe
MATRIX_0 = [
  ['X', '', ''],
  ['', 'X', ''],
  ['O', '', 'O']
]

MATRIX_1 = [
  ['', 'X', ''],
  ['X', 'X', ''],
  ['O', 'O', 'O']
]

def winner(arr)
  if arr[0][0] == arr[0][1] && arr[0][1] == arr[0][2]
    puts arr[0][0]
  elsif arr[1][0] == arr[1][1] && arr[1][1] == arr[1][2]
    puts arr[1][0]
  elsif arr[2][0] == arr[2][1] && arr[2][1] == arr[2][2]
    puts arr[2][0]

  elsif arr[0][0] == arr[1][0] && arr[1][0] == arr[2][0]
    puts arr[0][0]
  elsif arr[0][1] == arr[1][1] && arr[1][1] == arr[2][1]
    puts arr[0][1]
  elsif arr[0][2] == arr[1][2] && arr[1][2] == arr[2][2]
    puts arr[0][2]

  elsif arr[0][0] == arr[1][1] && arr[1][1] == arr[2][2]
    puts arr[0][0]
  elsif arr[2][0] == arr[1][1] && arr[1][1] == arr[2][0]
    puts arr[0][0]

  else
    puts ''
  end
end

winner(MATRIX_0)
winner(MATRIX_1)
