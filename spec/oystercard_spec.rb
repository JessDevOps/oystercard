require 'oystercard.rb'

describe Oystercard do

  it 'has a default balance' do
    expect(subject.balance).to eq 0 
  end

  it 'adds money to card' do 
    expect(subject).to respond_to(:add_money).with(1).argument
  end

end
