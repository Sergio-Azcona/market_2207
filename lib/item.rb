class Item
  attr_reader :name, :price
  def initialize(attribute)
    @name = attribute[:name] 
    @price = attribute[:price].delete("$").to_f
  end

  # def cost #*# initially was here but was wrong.. line 5 does this 
  #   @price.to_f
  # end

end
