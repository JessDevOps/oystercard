require 'oystercard.rb'

describe Oystercard do

  let(:entry_station){ double:station }
  let(:exit_station){ double:station }

  it 'has a default balance' do
    expect(subject.balance).to eq 0 
  end

  it 'adds money to card' do 
    expect(subject).to respond_to(:top_up).with(1).argument
  end
  # ARBITRARY AS OF CHAPTER 9 
  # it 'totals the balance' do
  #   expect { subject.top_up(10) }.to change { subject.balance }.by 10 
  # end

  # it 'removes money from card' do 
  #   expect(subject).to respond_to(:deduct).with(1).argument
  # end

  # it 'deducts money for fair' do
  #   subject.top_up(50)
  #   expect { subject.deduct(3) }.to change { subject.balance }.by -3
  # end
    
  it 'touches in for journey' do
    expect(subject).to respond_to(:touch_in)
  end

  it 'touches out for journey' do
    expect(subject).to respond_to(:touch_out)
  end

  it 'can tell if user is already in journey' do
    expect(subject).not_to be_in_journey
  end

  context 'checks card has enough balance before it' do

    before(:each) do
      subject.top_up(Oystercard::MAXIMUM_BALANCE)
    end
    
    it 'has a maximum balance' do
      expect { subject.top_up(5) }.to raise_error 'has exceeded max balance' 
    end

    it 'can touch in' do
      subject.touch_in(entry_station)
      expect(subject).to be_in_journey 
    end

    it 'takes a user out of a journey' do
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject).not_to be_in_journey
    end
    
    it 'deducts money from the card when user touches out' do
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect { subject.touch_out(exit_station) }.to change { subject.balance }.by -(Oystercard::MINIMUM_FARE)
    end

    it 'stores the station as entry station' do
      subject.touch_in(entry_station)
      expect(subject.entry_station).to eq entry_station
    end

    it 'stores a station as an exit station' do
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.exit_station).to eq exit_station
    end

  end

  it 'shows error message on touch in if card balance < 1' do
    expect { subject.touch_in(entry_station) }.to raise_error 'insufficient funds on card'
  end
  
end
