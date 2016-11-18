class DummyBot
  attr_accessor :current_facing
end

describe Base do
  let(:dummy_bot) { DummyBot.new }

  describe '.new' do
    context 'When robot does not have a facing' do
      it 'raise error' do
        expect{described_class.new(dummy_bot)}.to raise_error(
          CommandsException,
          'Before some action you need to set a place'
        )
      end
    end
  end

  describe '.run' do
    context 'When a subclass call base.run' do
      it 'raise error' do
        dummy_bot.current_facing = 'teste'
        expect{described_class.new(dummy_bot).run}.to raise_error(
          NotImplementedError,
          'Subclasses must implement #run'
        )
      end
    end
  end
end
