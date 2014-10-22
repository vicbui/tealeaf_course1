require "pry"
puts "Play Paper Rock Scissor !"

continue = ''
choices=['p','r','s']
full = {'p'=> 'Paper','r'=>'Rock','s'=>'Scissor'}

def is_win(player1,player2)
	results = 0 

	if player1 == player2 
		results = 1 
	elsif player1 == 'p' and player2 =='r' then results = 2 
	elsif player1 == 'r' and player2 =='s' then results = 2 
	elsif player1 == 's' and player2 =='p' then results = 2 

	end 

	return results

end 


until continue == 'N' do
	computer = rand(3) 
	#computer = 0 
	puts "Choose one :(P/R/S)"
	player = gets.chomp.downcase
	puts "you picked #{full[player]} and computer picked #{full[choices[computer]]}"
	#binding.pry
	if is_win(player,choices[computer]) == 0 
		puts "#{full[choices[computer]]} wins #{full[player]}"
		puts "Computer won !"
	elsif is_win(player,choices[computer]) == 1 
		puts "Same choice"
		puts "It's a tie"
	else 
		puts "#{full[player]} wins #{full[choices[computer]]}"
		puts "you won"
	end

	puts "Play Again ? (Y/N)"

	continue = gets.chomp


end  