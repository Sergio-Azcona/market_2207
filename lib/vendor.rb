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
      @inventory.each do |item|
        # inventory.item.each do |item, quality|
        # inventory_value[item].price * quantity
        # end
      end
      inventory_value
    end

end
