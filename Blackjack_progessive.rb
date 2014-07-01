#START THE GAME: a DEALER asks the USER if he wants play? 

  #initial variables at game start
  deck_count = 52
  card_count_user = 0 #each time a card gets dealt the deck_count goes down by 1 and either user/dealer go up by 1
  card_count_dealer = 0

  card_sum_user = 0 #each time a card gets dealt the card_sum increases by the value of the dealt card until card_sum > 21
  card_sum_dealer = 0

  #choosing cards RANDOMLY from a FINITE LIST of 52 cards and assigning the chosen card a specific VALUE
  new_card
  #array or hash of card_deck and their values



while card_sum_user <= 21
  puts "Hit or Stay?"
  ans = gets.chomp.downcase
    if ans == 'hit'
      card_sum_user += new_card
    else
      card_sum_dealer += new_card
    end
end



