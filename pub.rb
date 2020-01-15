class Pub

  attr_reader :name, :till_cash

  #constructors

  def initialize(name, till_cash)
    @name = name
    @till_cash = till_cash
    @drinks = []
    @foods = []
  end

  NO_SERVE_DRUNKESS_LEVEL = 90

  #methods

  def add_drinks(drinks)
    for drink in drinks
      @drinks.push(drink)
    end
  end

  def remove_drink(drink)
    @drinks.delete(drink)
  end

  def pub_drink_count()
    @drinks.count()
  end

  def is_drink_in_pub(input_drink)
    drink_is_in_pub = false
    for drink in @drinks
      if (drink.name == input_drink.name)
        drink_is_in_pub = true
      end
    end
    return drink_is_in_pub
  end

  def add_foods(foods)
    for food in foods
      @foods.push(food)
    end
  end

  def remove_food(food)
    @foods.delete(food)
  end

  def pub_food_count()
    @foods.count()
  end

  def is_food_in_pub(input_food)
    food_is_in_pub = false
    for food in @foods
      if (food.name == input_food.name)
        food_is_in_pub = true
      end
    end
    return food_is_in_pub
  end  

  def add_or_remove_cash(value)
    @till_cash +=value
  end

  def check_drinking_age_customer(customer)
    if(customer.get_age >= 18)
      return true
    else
      return false
    end
  end

  def sell_a_drink(customer, drink)
    if(check_drinking_age_customer(customer))
      if(customer.drunkeness <= NO_SERVE_DRUNKESS_LEVEL)
        if (is_drink_in_pub(drink))
          if (customer.wallet_cash >= drink.price)
            remove_drink(drink)
            customer.reduce_wallet_cash(drink)
            add_or_remove_cash(drink.price)
          else
            return "Sorry, #{customer.name} cannot afford to buy #{drink.name}"
          end
        else
          return "Sorry, #{drink.name} is not available"
        end
      else
        return "Sorry, #{customer.name} is too drunk to be served!"
      end
    else
      return "Sorry, #{customer.name} is too young to be served!"
    end
  end

end
