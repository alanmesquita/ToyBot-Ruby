class DummyBot
  AVAIABLE_FACING = [:north, :east, :south, :west]

  def place(x, y, facing); end
end

describe Commands::Place do
  let(:dummy_bot) { DummyBot.new }

  describe '.run' do
    context 'When send invalid args' do
      subject {described_class.new(dummy_bot, 'abc')}

      it 'raise error' do
        expect{subject.run}.to raise_error(
          CommandsException,
          "The param abc is invalid. Send a pattern like: 0,0,NORTH"
        )
      end
    end

    context 'When sends valid args' do
      subject {described_class.new(dummy_bot, '1,2,NORTH')}

      it 'calls robot place with correct values' do
        expect(dummy_bot).to receive(:place).with(1, 2, :north)
        subject.run
      end
    end
  end
end
