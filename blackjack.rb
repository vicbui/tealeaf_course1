
#After being dealt the initial 2 cards, the player goes first and can choose to either "hit" or "stay". 
#Hitting means deal another card. If the player's cards sum up to be greater than 21, the player has "busted" and lost.
#If the sum is 21, then the player wins. If the sum is less than 21, 
#then the player can choose to "hit" or "stay" again. 
#If the player "hits", then repeat above, but if the player stays, then the player's total value is saved, 
#and the turn moves to the dealer.
#
#By rule, the dealer must hit until she has at least 17. If the dealer busts, then the player wins. 
#If the dealer, hits 21, then the dealer wins. If, however, the dealer stays, then we compare 
#the sums of the two hands between the player and dealer; higher value wins.

def init_draw(draw)
    draw = []
	(0..52).each { |a| draw[a] = 0
	}
	return draw
end


def draw(all_cards)
    card = 0 
    loop do 
        card = rand(51)
        if all_cards.include?(card) == false then 
            break 
        end 
    end 
    return card 
end

def value(cards,decks)
    total = 0
	cards.each { |card|
        v = 0 
        if (decks[card] == 'J') or (decks[card] == 'Q') or (decks[card] == 'K')
            v = 10 
        elsif decks[card]=='1' 
                if total + 11 > 21 then v = 1 
                else v = 11
                end
        else 
            v = decks[card].to_i
        end 
        total = total + v
        
	 }

     return total
end 


def init_game(all_cards,player_card,dealer_card,decks)
    #player 2 cards 
    2.times {
       draw = draw(all_cards)
       all_cards[draw] = 1 
       player_card.push(draw)
    }
    #dealers 2 cards 
    2.times do 
        draw = draw(all_cards)
        all_cards[draw] = 1 
        dealer_card.push(draw)
    end 
    return all_cards
end


def turn(is_player,all_cards,choices,player_card,decks,player_name)
    option=''
    while ((option != 'stay' ) and (value(player_card,decks) < 21))
        option = ''
        draw = 0
        if is_player
            puts "#{player_name} : hit or stay"
            option = gets.chomp
        else 
            choice = 0
            if (value(player_card,decks) > 17 and (is_player==false)) then choice = rand(2) - 1 end
            
            option = choices[choice]
            puts "choice :#{choices[choice]}"
        end  
        if option == 'hit'
            draw = draw(all_cards)
            all_cards[draw] = 1 
            player_card.push(draw)
        end
        puts "you draw: #{decks[draw]},# card : #{player_card.length}  total = #{value(player_card,decks)}"
    end 
    return all_cards
end     

def print_cards(cards,decks)
        cards.each { |card|
            puts decks[card]
        }
end

def winner(player_card,dealer_card,decks,all_cards,choices,player_name)
    puts "#{player_name}'s turn"
    all_cards = turn(true,all_cards,choices,player_card,decks,player_name)
    puts "Player = #{value(player_card,decks)}"

    if value(player_card,decks) > 21 
        puts "player busted. Player lost"
    elsif value(player_card,decks) == 21 
        puts "player cards is 21. Player win"
    else
        puts "Dealer Turn"
        all_cards = turn(false,all_cards,choices,dealer_card,decks,player_name)
        puts "Dealer = #{value(dealer_card,decks)}"
        if value(dealer_card,decks) > 21 
            puts "dealer busted. Player win "
        elsif value(dealer_card,decks) == 21 
            puts "dealer cards is 21. Player lost"
        else 
            if value(player_card,decks) > value(dealer_card,decks) 
                puts 'player wins'
            elsif value(player_card,decks) < value(dealer_card,decks) 
                puts 'dealer wins'
            else
                puts 'ties'
            end
        end     #
    end 
end
### main 
decks  = ['1','2','3','4','5','6','7','8','9','10','J','Q','K',
	'1','2','3','4','5','6','7','8','9','10','J','Q','K',
	'1','2','3','4','5','6','7','8','9','10','J','Q','K',
	'1','2','3','4','5','6','7','8','9','10','J','Q','K']

choices = ['hit','stay']

## game starts #
puts "Enter your name "
player_name = gets.chomp
continue = 'Y' 
while continue == 'Y' 
    all_cards = []
    player_card = []
    dealer_card = []
    all_cards = init_draw(all_cards)
    all_cards = init_game(all_cards,player_card,dealer_card,decks)
    puts "#{player_name} = #{value(player_card,decks)}"
    puts "Dealer = #{value(dealer_card,decks)}"
    winner(player_card,dealer_card,decks,all_cards,choices,player_name)
    puts "Do you want to continue (Y/N)"
    continue = gets.chomp
end 








