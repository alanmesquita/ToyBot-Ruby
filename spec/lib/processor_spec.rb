describe Processor do
  let(:place) { Commands::Place }
  subject { described_class.new }

  describe '.execute' do
    context 'When sends an unavaiable command' do
      it 'raises error with command error message' do
        expect{subject.execute('teste')}.to raise_error(
          ProcessorException,
          "The command TESTE is not avaiable"
        )
      end
    end

    context 'When sends an avaiable command' do
      before do
        allow_any_instance_of(place).to receive(:validate).and_return(true)
        allow_any_instance_of(place).to receive(:run).and_return(true)
      end

      it 'call command' do
        expect(subject.execute('place')).to be_truthy
      end
    end
  end

  describe '.move' do
    context 'When does not implement move' do
      it 'raises not implemented error' do
        expect{subject.move}.to raise_error(
          NotImplementedError,
          'Subclasses must implement #move'
        )
      end
    end
  end

  describe '.place' do
    context 'When does not implement place' do
      it 'raises not implemented error' do
        expect{subject.place(1,2,3)}.to raise_error(
          NotImplementedError,
          'Subclasses must implement #place'
        )
      end
    end
  end

  describe '.report' do
    context 'When does not implement report' do
      it 'raises not implemented error' do
        expect{subject.report}.to raise_error(
          NotImplementedError,
          'Subclasses must implement #report'
        )
      end
    end
  end

  describe '.turn_right' do
    context 'When does not implement turn_right' do
      it 'raises not implemented error' do
        expect{subject.turn_right('teste')}.to raise_error(
          NotImplementedError,
          'Subclasses must implement #turn_right'
        )
      end
    end
  end

  describe '.turn_left' do
    context 'When does not implement turn_left' do
      it 'raises not implemented error' do
        expect{subject.turn_left('teste')}.to raise_error(
          NotImplementedError,
          'Subclasses must implement #turn_left'
        )
      end
    end
  end
end
