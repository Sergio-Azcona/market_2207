require './lib/item'
require './lib/vendor'
require './lib/market'

RSpec.describe Vendor do
  let(:item1) { Item.new({name: 'Peach', price: "$0.75"}) }
  let(:item2) { Item.new({name: 'Tomato', price: '$0.50'}) }
  let(:vendor) { Vendor.new("Rocky Mountain Fresh") }

  it 'should exist as a class with a name attribute for instance object' do
    expect(vendor).to be_a Vendor
    expect(vendor.name).to be_a String
    expect(vendor.name).to eq ( "Rocky Mountain Fresh")
  end

  it 'should check inventory and can return the items it hold with quality' do
    expect(vendor.inventory).to be_a Hash
    expect(vendor.inventory).to eq ({})
    vendor.stock(item1, 30)
    # require 'pry';binding.pry
    expect(vendor.inventory).to eq ({item1 => 30})
  end

  it 'should stock items, calculate the quantity in stock, and return the total in stock for each in inventory' do
    vendor.stock(item1, 30)
    expect(vendor.check_stock(item1)).to eq 30
    vendor.stock(item1, 25)
    expect(vendor.check_stock(item1)).to eq 55
    vendor.stock(item2, 12)
    expect(vendor.inventory).to eq ({item1 => 55, item2 => 12})

    vendor.stock(item1, -32)
    expect(vendor.check_stock(item1)).to eq 23
    expect(vendor.inventory).to eq ({item1 => 23, item2 => 12})
  end

  context 'testing for I3 final Q, potential revenue each vendor holds' do
    # let(:item1) { Item.new({name: 'Peach', price: "$0.75"}) }
    # let(:item2) { Item.new({name: 'Tomato', price: '$0.50'}) }
    # let(:item3) { Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"}) }
    # let(:item4) { Item.new({name: "Banana Nice Cream", price: "$4.25"}) }
    let(:vendor1) { Vendor.new("Rocky Mountain Fresh") }
    let(:vendor2) { Vendor.new("Ba-Nom-a-Nom") }
    let(:vendor3) { Vendor.new("Palisade Peach Shack") }
    let(:market) { Market.new("South Pearl Street Farmers Market") }
    let(:item1) { Item.new({name: 'Peach', price: "$0.75"}) }
    let(:item2) { Item.new({name: 'Tomato', price: '$0.50'}) }
    let(:item3) { Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"}) }
    let(:item4) { Item.new({name: "Banana Nice Cream", price: "$4.25"}) }

    it'should calculate vendor potential revenue based on quantity and unit price'do
        #sum of all their items' price * quantity

        
        vendor1.stock(item1, 35)
        vendor1.stock(item2, 7)
        vendor2.stock(item4, 50)
        vendor2.stock(item3, 25)
        vendor3.stock(item1, 65)
        market.add_vendor(vendor1)
        market.add_vendor(vendor2)
        market.add_vendor(vendor3)
        # expect(vendor.inventory).to eq ({item1 => 23, item2 => 12})

        # require 'pry';binding.pry
        expect(vendor1.potential_revenue).to eq 29.75
        expect(vendor2.potential_revenue).to eq 345.00
        expect(vendor3.potential_revenue).to eq 48.75
    end
  end
end