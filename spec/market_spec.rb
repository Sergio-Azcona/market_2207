require './lib/item'
require './lib/vendor'
require './lib/market'

RSpec.describe Market do
  let(:market) { Market.new("South Pearl Street Farmers Market") }
  let(:item1) { Item.new({name: 'Peach', price: "$0.75"}) }
  let(:item2) { Item.new({name: 'Tomato', price: '$0.50'}) }
  let(:item3) { Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"}) }
  let(:item4) { Item.new({name: "Banana Nice Cream", price: "$4.25"}) }
  let(:vendor1) { Vendor.new("Rocky Mountain Fresh") }
  let(:vendor2) { Vendor.new("Ba-Nom-a-Nom") }
  let(:vendor3) { Vendor.new("Palisade Peach Shack") }

  it 'should exist as a class and have a name attribute' do
    expect(market).to be_a Market
    expect(market.name).to eq("South Pearl Street Farmers Market")
  end

  it 'should be able to hold and display vendors, add vendors and return them in an array' do
    expect(market.vendors).to be_a Array
    expect(market.vendors).to eq([])
    market.add_vendor(vendor1)
    market.add_vendor(vendor2)
    market.add_vendor(vendor3)
    expect(market.vendors).to eq ([vendor1, vendor2, vendor3])
  end

  it 'should be able to return the name of all enlisted vendors' do
    market.add_vendor(vendor1)
    market.add_vendor(vendor2)
    market.add_vendor(vendor3)
    expect(market.vendors).to eq ([vendor1, vendor2, vendor3])
    # require 'pry';binding.pry
    expect(market.vendor_names).to eq (["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
  end

  it 'should inform which vendors sell a specific item' do
    vendor1.stock(item1, 35)
    vendor1.stock(item2, 7)
    market.add_vendor(vendor1)
    vendor2.stock(item2, 7)
    vendor2.stock(item3, 25)
    vendor2.stock(item4, 50)
    market.add_vendor(vendor2)
    vendor3.stock(item1, 65)
    vendor3.stock(item2, 2)
    market.add_vendor(vendor3)
    # require 'pry';binding.pry
    expect(market.vendors_that_sell(item1)).to eq ([vendor1, vendor3])
    expect(market.vendors_that_sell(item4)).to eq ([vendor2])

    expect(market.vendors_that_sell(item2)).to eq ([vendor1, vendor2, vendor3])
  end


end