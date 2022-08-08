class Item
  attr_reader :name, :price
  def initialize(attribute)
    @name = attribute[:name] 
    @price = attribute[:price].delete("$").to_f
  end

  def cost
    @price.to_f
  end

end
