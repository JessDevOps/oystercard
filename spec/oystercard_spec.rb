require 'oystercard.rb'

describe Oystercard do

  it 'has a default balance' do
    expect(subject.balance).to eq 0 
  end

  it 'adds money to card' do 
    expect(subject).to respond_to(:top_up).with(1).argument
  end

  it 'totals the balance' do
    expect { subject.top_up(10) }.to change { subject.balance }.by 10 
  end

  it 'has a maximum balance' do
    subject.top_up(90)
    expect { subject.top_up(5) }.to raise_error 'has exceeded max balance' 
  end

  it 'removes money from card' do 
    expect(subject).to respond_to(:deduct).with(1).argument
  end

  it 'deducts money for fair' do
    subject.top_up(50)
    expect { subject.deduct(3) }.to change { subject.balance }.by -3
  end
    

end
