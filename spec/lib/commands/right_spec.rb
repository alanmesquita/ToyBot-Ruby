class DummyBot
  attr_accessor :current_facing

  AVAIABLE_FACING = [:north, :east, :south, :west]
  ROTATE_SIZE = 1

  def turn_right(facing); end
end

describe Commands::Right do
  let(:dummy_bot) { DummyBot.new }

  describe '.run' do
    context 'When sends command to rotate right' do
      subject {
        dummy_bot.current_facing = :south
        described_class.new(dummy_bot)
      }

      it 'change facing to right' do
        expect(dummy_bot).to receive(:turn_right).with(:west)
        subject.run
      end
    end
  end
end
