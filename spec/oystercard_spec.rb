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

  it 'removes money from card' do 
    expect(subject).to respond_to(:deduct).with(1).argument
  end

  it 'deducts money for fair' do
    subject.top_up(50)
    expect { subject.deduct(3) }.to change { subject.balance }.by -3
  end
    
  it 'touches in for journey' do
    expect(subject).to respond_to(:touch_in)
  end

  it 'touches out for journey' do
    expect(subject).to respond_to(:touch_out)
  end

  it 'can tell if user is already in journey' do
    expect(subject).not_to be_in_journey
  end

  context 'to check card has enough balance' do
    before(:each) do
      subject.top_up(Oystercard::MAXIMUM_BALANCE)
    end
    
    it 'has a maximum balance' do
      expect { subject.top_up(5) }.to raise_error 'has exceeded max balance' 
    end

    it 'can touch in' do
      subject.touch_in
      expect(subject).to be_in_journey 
    end

  end

  it 'takes a user out of a journey' do
    subject.touch_in
    subject.touch_out
    expect(subject).not_to be_in_journey
  end

end
