class Item
  attr_reader :name, :price
  def initialize(attribute)
    @name = attribute[:name] 
    @price = attribute[:price].to_f
  end

end
