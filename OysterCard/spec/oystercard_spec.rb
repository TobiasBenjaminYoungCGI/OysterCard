require 'oystercard'

describe OysterCard do
  let(:entry_station){ double :entry_station }
  let(:exit_station){ double :exit_station }
  let(:journey){ { entry_station: entry_station, exit_station: exit_station} }

 it 'has a balance' do
   expect(subject.balance).to eq(0)
 end

 describe 'Journey' do
   subject = OysterCard.new
   subject.top_up(10)

   it 'has  an empty list of journeys by default' do
     expect(subject.journeys).to be_empty
   end

   it 'stores a journey' do
     subject.touch_in(entry_station)
     subject.touch_out(exit_station)

     expect(subject.journeys).to include journey
   end
  end

 describe 'Touching in/Out' do
   subject = OysterCard.new
   subject.top_up(10)

   it 'can top up the card' do
     expect(subject.balance).to eq(10)
   end

   it 'can touch in' do
     subject.touch_in(entry_station)

     expect(subject.in_journey?).to eq true
   end

   it 'can touch out' do
     subject.touch_in(entry_station)

     expect { subject.touch_out(exit_station) }.to change { subject.balance }.by(-OysterCard::MINIMUM_AMOUNT)
   end
 end

 describe 'Stations' do
   subject = OysterCard.new
   subject.top_up(6)
   
   it 'can remember the entry station' do
    subject.touch_in(entry_station)

    expect(subject.entry_station).to eq entry_station
   end

   it 'forgets entry station' do
     subject.touch_in(entry_station)
     subject.touch_out(exit_station)

     expect(subject.entry_station).to eq nil
   end

   it 'remember exit station' do
     subject.touch_in(entry_station)
     subject.touch_out(exit_station)

     expect(subject.exit_station).to eq exit_station
   end
 end
 # it 'Exceeds the Card limit' do
 #   max_bal = OysterCard::CARD_LIMIT
 #   subject.top_up(max_bal)
 #   expect(subject.top_up(1)).to raise_error "Maximum balance exceeded"
 # end
end
