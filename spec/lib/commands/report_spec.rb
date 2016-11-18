class DummyBot
  attr_accessor :current_facing
  def report; end
end

describe Commands::Report do
  let(:dummy_bot) { DummyBot.new }

  before do
    allow(dummy_bot).to receive(:current_facing).and_return(true)
  end

  describe '.run' do
    context 'When sends command to report' do
      subject {described_class.new(dummy_bot)}

      it 'calls robot report' do
        expect(dummy_bot).to receive(:report).with(no_args)
        subject.run
      end
    end
  end
end
