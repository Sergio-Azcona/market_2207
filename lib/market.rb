class Market
  attr_reader :name, :vendors
  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map { |vendor| vendor.name }
  end

  def vendors_that_sell(product)
    @vendors.find_all do |vendor|
      vendor.inventory.include?(product)
    end
  end

  def sorted_item_list
    list_of_items = []
    @vendors.each do |vendor|
      vendor.inventory.each do |item, quantity|
        list_of_items[item] 
        require'pry';binding.pry
      end
    end
  list_of_items
  end



end
