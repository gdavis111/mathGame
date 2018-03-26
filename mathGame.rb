# class Turn_manager
#   deals with switching player turns
#   stops game when one player loses all lives
#

# class Game

# class Question
#   generates random math questions
#   checks answers

require './questions.rb'
require './player.rb'
require './turnManager.rb'

class Game
  attr_accessor :summary, :player1, :player2, :turn

  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")

    @players = [player1, player2]
    @turn = TurnManager.new(@players)
  end

  def summary
    @gameSummary = "#{player1.summary}  -VS-  #{player2.summary}"
    """#{@gameSummary}"""
  end

  def players
    @winner = @players.select { |p| !p.lost? }
  end

  def find_winner
    puts " ---------- GAME OVER ---------- "
    puts "#{@winner.first.name} wins with a score of #{@winner.first.lives}/3"
  end

  def run
    question = Question.new

    while !player1.lost? && !player2.lost?
      current_turn_player = @turn.current_player

      if current_turn_player.lost?
        puts "#{current_turn_player.name} lost the game!"
      end

      question.ask
      # answer = question.num1 + question.num2
      puts "\n"
      puts "#{current_turn_player.name}: What does #{question.num1} + #{question.num2} equal?"
      player_answer = gets.chomp.to_i

      if player_answer === question.answer
        puts "Correct!"
        sleep 1.0
      else
        puts "#{current_turn_player.name}: No! Thats not right! You lose a life!"
        current_turn_player.wrong
        sleep 1.0
      end

      puts "\n"
      puts summary

      if !player1.lost? && !player2.lost?
        puts @turn.next_turn
      end

    end
    players
    find_winner
  end

end
