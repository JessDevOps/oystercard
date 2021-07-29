require 'station.rb'

describe Station do

  it 'should return station when station is called' do
    station = Station.new("Piccadilly Circus", 1)
    expect(station.station).to eq("Piccadilly Circus")
  end

  it 'should return zone when station is called' do
    station = Station.new("Piccadilly Circus", 1)
    expect(station.zone).to eq(1)
  end
end



