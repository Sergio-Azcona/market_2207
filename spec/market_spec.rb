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

  xit 'should have an array of vendors' do
    expect(market.vendors).to be_a Array
    expect(market.vendors).to eq([])
  end

  xit 'should ' do

    expect().to eq
  end


end