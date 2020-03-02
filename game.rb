require_relative './player'

class Game
  attr_accessor :player1, :player2
  
  def initialize
    @player1 = Player.new('Player 1')
    @player2 = Player.new('Player 2')
    @current_player = @player1 
  end

  def change_player
    if (@current_player == @player1 )
      return @current_player = @player2
    else
      return 
    end

  end

  def show_current_player
    puts "@current_player: #{@current_player.name}"
  end


  def showPlayers
    puts @player1.name
    puts @player2.name
    puts @player1.lives 
    puts @player2.lives
  end

  def display_players_lives
    puts "P1: #{@player1.lives} / 3 vs P2: #{@player2.lives} / 3"
  end

  def display_new_turn
    puts "-----NEW TURN-------"
  end

  def question
    print 
    num1 = (rand(1..20))
    num2 = (rand(1..20))
    answer = num1 + num2 
  
    print "#{@current_player.name}: "
    puts "What does #{num1} plus #{num2}?"
    input_num = gets.to_i;
    
    if answer == input_num
      puts "Yes, you are correct"
      display_players_lives
    else 
      puts "Seriously, No!"
      @current_player.lives -= 1
      display_players_lives
    end

  end


  def who_win
    if (@player1.lives > @player2.lives)
      puts "Player 1 wins with a score of #{@player1.lives} / 3"
    else
      puts "Player 2 wins with a score of #{@player2.lives} / 3"
    end
  end



  def play
    
    while @current_player.lives > 0 do
      question
      change_player
      puts "--- New Turn ---"
    end
    who_win
    puts "--- some time later ---"
    puts "--- Game Over ---"
    puts "Good bye!"
  end

end