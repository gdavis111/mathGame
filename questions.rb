class Question
  attr_accessor :num1, :num2, :answer, :ask

  def ask
    @num1 = rand(20) + 1
    @num2 = rand(20) + 1
    @answer = @num1 + @num2
  end
end
