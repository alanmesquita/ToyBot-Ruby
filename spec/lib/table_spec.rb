describe Table do
  describe '.set_place' do
    context "When it can't walk" do
      it 'raises error' do
        table = described_class.new
        expect{table.set_place(99, 99)}.to raise_error(TableException)
      end
    end

    context 'When can walk' do
      it 'set location' do
        table = described_class.new
        table.set_place 0, 0
        expect(table.x).to be(0)
        expect(table.y).to be(0)
      end
    end
  end

  describe '.move_by_direction' do
    context 'When dont have location' do
      it 'raises error' do
        table = described_class.new
        expect{table.move_by_direction(1, :north)}.to raise_error(TableException)
      end
    end

    context 'When try to move to unavaiablle location' do
      it 'raises error' do
        table = described_class.new
        table.set_place 0, 0
        expect{table.move_by_direction(1, :west)}.to raise_error(TableException)
      end
    end

    context 'When try to move to unavaiablle location' do
      subject { described_class.new }

      it 'walks to north' do
        subject.set_place 0, 0
        subject.move_by_direction(1, :north)
        expect(subject.x).to be(0)
        expect(subject.y).to be(1)
      end

      it 'walks to east' do
        subject.set_place 0, 0
        subject.move_by_direction(1, :east)
        expect(subject.x).to be(1)
        expect(subject.y).to be(0)
      end

      it 'walks to south' do
        subject.set_place 1, 1
        subject.move_by_direction(1, :south)
        expect(subject.x).to be(1)
        expect(subject.y).to be(0)
      end

      it 'walks to west' do
        subject.set_place 1, 0
        subject.move_by_direction(1, :west)
        expect(subject.x).to be(0)
        expect(subject.y).to be(0)
      end
    end
  end
end
