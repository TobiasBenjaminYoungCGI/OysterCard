require 'oystercard'

describe OysterCard do

 it 'has a balance' do
   expect(subject.balance).to eq(0)
 end

 it 'can top up the card' do
   subject.top_up(10)
   expect(subject.balance).to eq(10)
 end

 # it 'Exceeds the Card limit' do
 #   max_bal = OysterCard::CARD_LIMIT
 #   subject.top_up(max_bal)
 #   expect(subject.top_up(1)).to raise_error "Maximum balance exceeded"
 # end
end
