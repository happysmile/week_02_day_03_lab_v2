require('minitest/autorun')
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../pub.rb")
require_relative("../drink.rb")
require_relative("../customer.rb")

class TestPub < MiniTest::Test

  def setup()
    @drink1 = Drink.new("Beers are Us", 5, 2)
    @drink2 = Drink.new("Rainbow", 7, 13)
    @drink3 = Drink.new("Sunshine", 4, 45)
    @drink_not_present = Drink.new("Hello World",20,99)
    drinks = [@drink1, @drink2, @drink3]
    @pub = Pub.new("Something Arms", 3400)
    @pub.add_drinks(drinks)
    @customer1 = Customer.new("Andrew", 45, 21)
    @customer2 = Customer.new("Sheila", 25, 20)
    @customer3 = Customer.new("Lorna", 12, 17)
  end

  def test_pub_name
    assert_equal("Something Arms", @pub.name)
  end

  def test_pub_till_cash()
    assert_equal(3400, @pub.till_cash)
  end

  def test_pub_drinks()
    assert_equal(3, @pub.pub_drink_count())
  end

  def test_add_or_remove_cash()
    assert_equal(3405, @pub.add_or_remove_cash(5))
  end

  def test_remove_drink()
    assert_equal(3,@pub.pub_drink_count())
    @pub.remove_drink(@drink1)
    assert_equal(2,@pub.pub_drink_count())
  end

  def test_is_drink_in_pub()
    assert_equal(true, @pub.is_drink_in_pub(@drink2))
    assert_equal(false, @pub.is_drink_in_pub(@drink_not_present))
  end

  def test_check_drinking_age_customer()
    assert_equal(true, @pub.check_drinking_age_customer(@customer1))
    assert_equal(false, @pub.check_drinking_age_customer(@customer3))
  end

  def test_sell_a_drink()
    @pub.sell_a_drink(@customer2, @drink1)
    assert_equal(2, @pub.pub_drink_count())
    assert_equal(20, @customer2.wallet_cash)
    assert_equal(3405, @pub.till_cash)
  end

end
