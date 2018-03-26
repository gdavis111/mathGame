class Player
  attr_accessor :name, :wrong, :lives

  def initialize(name)
    @name = name
    @lives = 3
  end

  def wrong
    @lives = @lives - 1
  end

  def lost?
    @lives <= 0
  end

  def summary
    "#{@name}: #{@lives}/3"
  end

end
