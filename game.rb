class Game

  def initialize
    @rolls = Array.new
  end

  def roll(pins)
    @rolls.push pins
  end

  def score
    total_score = 0
    frameIndex = 0
    (1..10).each do
      if isSpare frameIndex
        total_score = total_score + 10 + spare_bonus(frameIndex)
        frameIndex = frameIndex + 2
      elsif isStrike frameIndex
        total_score = total_score + 10 + strike_bonus(frameIndex)
        frameIndex = frameIndex + 1
      else
        total_score = total_score + sum_of_balls_in_frame(frameIndex)
        frameIndex = frameIndex + 2
      end
    end
    total_score
  end

  def isSpare(frameIndex)
    10 == @rolls.at(frameIndex) + @rolls.at(frameIndex+1)
  end

  def spare_bonus(frameIndex)
    @rolls.at(frameIndex + 2)
  end

  def isStrike(frameIndex)
    10 == @rolls.at(frameIndex)
  end

  def strike_bonus(frameIndex)
    @rolls.at(frameIndex + 1) + @rolls.at(frameIndex + 2)
  end

  def sum_of_balls_in_frame(frameIndex)
    @rolls.at(frameIndex) + @rolls.at(frameIndex + 1)
  end
end