class DummyBot
  attr_accessor :current_facing

  AVAIABLE_FACING = [:north, :east, :south, :west]
  ROTATE_SIZE = 1

  def turn_left(facing); end
end

describe Commands::Left do
  let(:dummy_bot) { DummyBot.new }

  describe '.run' do
    context 'When sends command to rotate left' do
      subject {
        dummy_bot.current_facing = :south
        described_class.new(dummy_bot)
      }

      it 'change facing to left' do
        expect(dummy_bot).to receive(:turn_left).with(:east)
        subject.run
      end
    end
  end
end
