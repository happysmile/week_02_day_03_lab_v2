require('minitest/autorun')
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../customer.rb")
require_relative("../pub.rb")
require_relative("../drink.rb")
require_relative("../food.rb")

class TestCustomer < MiniTest::Test

  def setup()
    @customer1 = Customer.new("Andrew", 10, 21)
    @customer2 = Customer.new("Francesca", 7, 18)
    @drink = Drink.new("Rain", 8, 4)
    @drink1 = Drink.new("Beers are Us", 5, 2)
    @drink2 = Drink.new("Rainbow", 7, 13)
    @drink3 = Drink.new("Sunshine", 4, 45)
    drinks = [@drink, @drink1, @drink2, @drink3]
    @pub = Pub.new("Something Arms", 3400)
    @pub.add_drinks(drinks)
    @food1 = Food.new("Peanuts", 3, 3)
    @food2 = Food.new("Burger", 11, 13)
    @food3 = Food.new("Chips", 4, 8)
    foods = [@food1, @food2, @food3]
    @pub.add_foods(foods)
  end

  def test_customer_name()
    assert_equal("Andrew", @customer1.name)
  end

  def test_customer_cash()
    assert_equal(10, @customer1.wallet_cash)
  end

  def test_check_if_enough_money_in_wallet()
    assert_equal(true, @customer1.enough_money_in_wallet(@drink))
    assert_equal(false, @customer2.enough_money_in_wallet(@drink))
  end

  def test_add_drink_to_customer()
    assert_equal(0, @customer1.customer_drink_count)
    @customer1.add_drink(@drink2)
    assert_equal(1, @customer1.customer_drink_count)
  end

  def test_reduce_wallet_cash()
    @customer1.reduce_wallet_cash(@drink)
    assert_equal(2, @customer1.wallet_cash())
  end

  def test_increase_drunkeness_level()
    assert_equal(0,@customer2.drunkeness)
    @customer2.increase_drunkeness_level(@drink)
    assert_equal(@drink.alcohol_level, @customer2.drunkeness)
  end

  def test_buy_a_drink()
    @customer2.buy_a_drink(@pub, @drink1)
    assert_equal(3, @pub.pub_drink_count())
    assert_equal(2, @customer2.wallet_cash)
    assert_equal(3405, @pub.till_cash)
  end

  def test_buy_food()
    @customer2.buy_food(@pub, @food3)
    assert_equal(2, @pub.pub_food_count())
    assert_equal(3, @customer2.wallet_cash)
    assert_equal(3404, @pub.till_cash)
  end

end
