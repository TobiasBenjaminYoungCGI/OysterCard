require 'oystercard'

describe OysterCard do
 it {is_expected.to respond_to :initalize}

 it 'has a balance' do
   expect(subject.initalize).to eq(0)
 end
end
