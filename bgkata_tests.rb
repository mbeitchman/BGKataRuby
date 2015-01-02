require 'test/unit'
require './game'

class BGKataTests < Test::Unit::TestCase

  def setup
    @g = Game.new
  end

  def test_gutter_game
    roll_many 20, 0
    assert_equal 0, @g.score

  end

  def test_all_ones
    roll_many 20, 1
    assert_equal 20, @g.score
  end

  def test_one_spare
    roll_spare
    @g.roll 3
    roll_many 17, 0
    assert_equal 16, @g.score
  end

  def test_one_strike
    roll_strike
    @g.roll 1
    @g.roll 3
    roll_many 16, 0
    assert_equal 18, @g.score
  end

  def test_perfect_game
    roll_many 12, 10
    assert_equal 300, @g.score
  end

  def roll_strike
    @g.roll 10
  end

  def roll_spare
    @g.roll 4
    @g.roll 6
  end

  def roll_many(rolls, pins)
    (1..rolls).each do
      @g.roll pins
    end
  end
end