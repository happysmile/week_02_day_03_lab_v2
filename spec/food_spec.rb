require('minitest/autorun')
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../food.rb")

class TestFood < MiniTest::Test

  def setup()
    @food = Food.new("Peanuts", 5, 2)
  end

  def test_food_name()
    assert_equal("Peanuts", @food.name)
  end

  def test_food_price()
    assert_equal(5, @food.price)
  end

end
