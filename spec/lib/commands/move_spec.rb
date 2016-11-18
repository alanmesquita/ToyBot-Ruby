class DummyBot
  attr_accessor :current_facing
  def move; end
end

describe Commands::Move do
  let(:dummy_bot) { DummyBot.new }

  before do
    allow(dummy_bot).to receive(:current_facing).and_return(true)
  end

  describe '.run' do
    context 'When sends command to move' do
      subject {described_class.new(dummy_bot)}

      it 'calls robot move' do
        expect(dummy_bot).to receive(:move).with(no_args)
        subject.run
      end
    end
  end
end
