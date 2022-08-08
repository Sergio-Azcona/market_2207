require './lib/item'
require './lib/vendor'

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
end