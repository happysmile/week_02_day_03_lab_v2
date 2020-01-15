require('minitest/autorun')
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../customer.rb")
require_relative("../drink.rb")
require_relative("../pub.rb")


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
    @pub.add_drink(drinks)
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
end
