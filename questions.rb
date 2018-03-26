

class Question
  attr_accessor :num1, :num2, :answer, :ask

  def ask
    @num1 = rand(20) + 1
    @num2 = rand(20) + 1
    @answer = @num1 + @num2
    # puts "What is #{@num1} + #{@num2}?"
    # @player_answer = gets.chomp.to_i

    # if @player_answer === @answer
    #   puts "Correct!"
    # elsif
    #   puts "No! Thats not right!"
    #   current_player.wrong
    # end
  end
end
