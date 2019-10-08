require 'oystercard'

describe OysterCard do
  let(:station){ double :station }

 it 'has a balance' do
   expect(subject.balance).to eq(0)
 end

 describe 'Touching in/Out' do
   subject = OysterCard.new
   subject.top_up(10)

   it 'can top up the card' do
     expect(subject.balance).to eq(10)
   end

   it 'can touch in' do
     subject.touch_in(station)

     expect(subject.in_journey?).to eq true
   end

   it 'can touch out' do
     subject.touch_in(station)

     expect { subject.touch_out }.to change { subject.balance }.by(-OysterCard::MINIMUM_AMOUNT)
   end
 end

 describe 'entryStations' do
   subject = OysterCard.new
   subject.top_up(2)
   it 'can remember the entry station' do
    subject.touch_in(station)
    expect(subject.entry_station).to eq station
   end

   it 'forgets entry station' do
     subject.touch_in(station)
     subject.touch_out
     expect(subject.entry_station).to eq nil
   end
 end
 # it 'Exceeds the Card limit' do
 #   max_bal = OysterCard::CARD_LIMIT
 #   subject.top_up(max_bal)
 #   expect(subject.top_up(1)).to raise_error "Maximum balance exceeded"
 # end
end
