require './lib/item'
require './lib/vendor'

RSpec.describe Item do
  let(:item1) { Item.new({name: 'Peach', price: "$0.75"}) }
  let(:item2) { Item.new({name: 'Tomato', price: '$0.50'}) }


  it 'should exist as a class' do
    expect(item1).to be_a Item
  end

  it 'should have a name attribute for the instance object' do
    expect(item2.name).to eq ("Tomato")
  end

  it 'should return a price for the item' do
    # require 'pry';binding.pry
    expect(item2.price).to eq 0.5
  end

end