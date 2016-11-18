describe Robot do
  let(:table) { Table.new }

  describe '.move' do
    context "When move is called" do
      subject { described_class.new(table) }

      before do
        allow(table).to receive(:move_by_direction).and_return true
      end

      it 'it call move_by_direction with correct params' do
        subject.current_facing = 'teste'

        expect(table).to receive(:move_by_direction).with(1, 'teste')
        subject.move
      end
    end
  end

  describe '.place' do
    context "When place is called" do
      subject { described_class.new(table) }

      before do
        allow(table).to receive(:set_place).and_return true
      end

      it 'it set facing and call set place with correct params' do
        expect(table).to receive(:set_place).with(1, 2)
        subject.place(1, 2, :teste)
        expect(subject.current_facing).to be(:teste)
      end

    end
  end

  describe '.report' do
    context "When report is called" do
      subject { described_class.new(table) }

      before do
        allow(table).to receive(:x).and_return 1
        allow(table).to receive(:y).and_return 2
      end

      it 'it return report string' do
        subject.current_facing = :west
        expect(subject.report).to eq('1,2,WEST')
      end
    end
  end

  describe '.turn_left' do
    context "When turn_left is called" do
      subject { described_class.new(table) }

      it 'it set facing' do
        subject.turn_left(:west)
        expect(subject.current_facing).to be(:west)
      end
    end
  end

  describe '.turn_right' do
    context "When turn_right is called" do
      subject { described_class.new(table) }

      it 'it set facing' do
        subject.turn_right(:north)
        expect(subject.current_facing).to be(:north)
      end
    end
  end
end
