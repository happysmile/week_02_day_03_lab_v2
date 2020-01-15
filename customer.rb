class Customer

  attr_reader :name, :wallet_cash, :age, :drunkeness

  #constructors

  def initialize(name, wallet_cash, age)
    @name = name
    @wallet_cash = wallet_cash
    @age = age
    @customer_drinks = []
    @drunkeness = 0
  end

  # methods

  def get_age()
    return @age
  end

  def increase_drunkeness_level(drink)
    @drunkeness += drink.alcohol_level
  end

  def customer_drink_count()
    @customer_drinks.count()
  end

  def enough_money_in_wallet(drink)
    if @wallet_cash >= drink.price
      return true
    else
      return false
    end
  end

  def add_drink(drink)
    @customer_drinks.push(drink)
  end

  def reduce_wallet_cash(drink)
    price = drink.price
    @wallet_cash -= price
  end

end
