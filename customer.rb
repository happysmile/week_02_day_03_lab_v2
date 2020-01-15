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

  NO_SERVE_DRUNKESS_LEVEL = 90

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

  def buy_a_drink(pub, drink)
    if(pub.check_drinking_age_customer(self))
      if(@drunkeness <= NO_SERVE_DRUNKESS_LEVEL)
        if (pub.is_drink_in_pub(drink))
          if (@wallet_cash >= drink.price)
            pub.remove_drink(drink)
            reduce_wallet_cash(drink)
            pub.add_or_remove_cash(drink.price)
          else
            return "Sorry, #{@name} cannot afford to buy #{drink.name}"
          end
        else
          return "Sorry, #{drink.name} is not available"
        end
      else
        return "Sorry, #{@name} is too drunk to be served!"
      end
    else
      return "Sorry, #{@name} is too young to be served!"
    end
  end

  def buy_food(pub, food)
    if (pub.is_food_in_pub(food))
      if (@wallet_cash >= food.price)
        pub.remove_food(food)
        reduce_wallet_cash(food)
        pub.add_or_remove_cash(food.price)
        if(drunkeness>=food.rejuvenation_level)
          drunkeness -= food.rejuvenation_level
        else
          drunkenss = 0
        end
      else
        return "Sorry, #{@name} cannot afford to buy #{food.name}"
      end
    else
      return "Sorry, #{food.name} is not available"
    end
  end

  end
