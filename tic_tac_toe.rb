require 'pry'
def is_finished(board)
	is_finished = false 
	if board[1] == board[2] and board[1] == board[3] and board[1] !=' ' then is_finished = true end
	if board[1] == board[4] and board[1] == board[7] and board[1] !=' ' then is_finished = true end
	if board[1] == board[5] and board[1] == board[9] and board[1] !=' ' then is_finished = true end
	if board[2] == board[5] and board[2] == board[8] and board[2] !=' ' then is_finished = true end
	if board[3] == board[5] and board[3] == board[7] and board[3] !=' ' then is_finished = true end
	if board[3] == board[6] and board[3] == board[9] and board[3] !=' ' then is_finished = true end
	if board[4] == board[5] and board[4] == board[6] and board[4] !=' ' then is_finished = true end
	if board[7] == board[8] and board[7] == board[9] and board[7] !=' ' then is_finished = true end

	return is_finished
end 

def draw_board(board)
	system("clear")
	puts "     |     |     "
	puts "  #{board[1]}  |  #{board[2]}  |  #{board[3]}  "
	puts "     |     |     "
	puts "-----+-----+-----"
	puts "     |     |     "
	puts "  #{board[4]}  |  #{board[5]}  |  #{board[6]}  "
	puts "     |     |     "
	puts "-----+-----+-----"
	puts "     |     |     "
	puts "  #{board[7]}  |  #{board[8]}  |  #{board[9]}  "
	puts "     |     |     "
	puts "-----+-----+-----"
end

board =[' ',' ',' ',' ',' ',' ',' ',' ',' ',' ']
player_turn = true 
player = []
computer =[]

draw_board(board)
loop do
	move = 0 
	make_move = false 
	loop do 
		if player_turn 
			puts "Choose a position (from 1 to 9) to place a piece :"
		 	move = gets.chomp.to_i
		else
			move = rand(8)+1
		end

		if (board[move]==' ' and move >0 and move <=9) then break
		else 
			if player_turn then puts "Existed. Enter different move" end 
		end 

	end 
	
	if player_turn 
		player.push(move)
		board[move] = 'X'
	else 
		computer.push(move)
		board[move] = 'O'
	end 

	draw_board(board)
	player_turn = !player_turn

	if is_finished(board) then 
		if player_turn then puts 'computer wins'
		else puts 'player win'
		end 
		break 
	end 
end 



