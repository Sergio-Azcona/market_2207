class Vendor
  attr_reader :name, :inventory
  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def stock(product, amount)
    @inventory[product] += amount
  end

  def check_stock(product)
    @inventory[product]
  end

  def potential_revenue
    inventory_value = 0
      @inventory.each do |item, quantity|
        inventory_value += item.price * quantity
        
        # require 'pry';binding.pry
        # inventory_value[product.price] * amount
        # require 'pry';binding.pry
        # end
      end
      inventory_value
    end

end
