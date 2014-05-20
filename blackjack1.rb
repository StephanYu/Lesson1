#Blackjack procedural game

#Defining methods
def sum_cards(cards) #keeping track of the total value of each players hand [['S', '10'], ['D', '2'], ...]
  #value of each element pushed in depends on element[1]
  #initial counter set to zero
  count = 0
  arr = cards.map {|e| e[1]}
  arr.each do |value|
    if value == "A"
      count += 11
    elsif value.to_i == 0 #J, Q, K
      count += 10
    else
      count += value.to_i
    end
  end

  #correcting for aces
  arr.select {|e| e == "A"}.count.times do
    if count > 21
      count -= 10
    end
  end

  count 
end

puts 'Hello, what is your name?'
user_name = gets.chomp.capitalize

puts 'Hello ' + user_name + '. Let \'s play a game of Blackjack!'

#Variable declaration and initiation

cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
suits = ['S', 'C', 'D', 'H']

deck = suits.product(cards)
deck.shuffle!

user_cards = []
dealer_cards = []


#Dealing the cards
user_cards << deck.pop
dealer_cards << deck.pop
user_cards << deck.pop
dealer_cards << deck.pop

user_total = sum_cards(user_cards)
dealer_total = sum_cards(dealer_cards)

#Show the cards
puts "The dealer has #{dealer_cards[0]} and #{dealer_cards[1]} for a total of #{dealer_total}."
puts "You have #{user_cards[0]} and #{user_cards[1]} for a total of #{user_total}."
puts

#Start Player betting
if user_total == 21
  puts 'Congratulations. You have got BlackJack.'
  exit
end

while user_total < 21
    puts 'What would you like to do next? Hit or Stay?'
    hit_or_stay = gets.chomp.downcase

    if !['hit', 'stay'].include?(hit_or_stay)
      puts "Error: Please choose hit or stay"
      next
    end

    if hit_or_stay == 'stay'
      puts "You chose to stay. It is the dealer's turn now."
      break
    end

    new_card = deck.pop
    puts "Your new card is #{new_card}"
    user_cards << new_card
    user_total = sum_cards(user_cards)
    puts "Your new total is: #{user_total}"

    if user_total == 21
      puts "Congratulations. You hit Blackjack. You win."
      exit
    elsif user_total > 21
      puts "Sorry. You lose."
      exit
    end
end 

#Start Dealer Betting

while dealer_total < 17 
  new_card = deck.pop
  puts "The dealer has #{new_card}"
  dealer_cards << new_card
  dealer_total = sum_cards(dealer_cards)
  puts "The dealers new total is: #{dealer_total}"

  if dealer_total == 21
    puts "The dealer has got Blackjack. He won. You lost."
    exit
  elsif dealer_total > 21
    puts "The dealer got busted. You won."
    exit
  end

end

#Comparing Cards
puts
puts "Time to compare cards."
dealer_cards.each do |card|
  puts "Dealer cards are: #{card}"
end

puts
user_cards.each do |card|
  puts "Your cards are: #{card}"
end

if user_total < dealer_total
  puts "Sorry, Dealer's total of #{dealer_total} beats your total of #{user_total}. You lose"
elsif user_total > dealer_total
  puts "Congratulations. You beat the dealer. You win."
else
  puts "It is a tie. Try again if you dare."
end

exit
  























