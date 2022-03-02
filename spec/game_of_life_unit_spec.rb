describe GameOfLife do
  context '#new_state_of_cell' do
    context 'when cell is dead' do
      it 'stays dead if its neighbours are all dead' do
        initial_state = :dead
        living_neighbours_count = 0

        new_state = subject.new_state_of_cell(initial_state, living_neighbours_count)

        expect(new_state).to eq(:dead)
      end
    end
  end

  context '#number_of_living_neighbours' do
    it 'returns 0 given the middle cell in a dead grid' do
      target_cell = :dead

      dead_cells = [
        [:dead, :dead,        :dead],
        [:dead, :target_cell, :dead],
        [:dead, :dead,        :dead]
      ]

      cell_row = 1
      cell_column = 1

      expect(
        subject.number_of_living_neighbours(cell_row, cell_column, dead_cells)
      ).to eq(0)
    end
  end

  context '#number_of_living_neighbours' do
    it 'returns 0 given a cell with only one living neighbour' do
      target_cell = :live

      dead_cells = [
        [:dead, :dead,        :dead],
        [:dead, :target_cell, :live],
        [:dead, :dead,        :dead]
      ]

      cell_row = 1
      cell_column = 1

      expect(
        subject.number_of_living_neighbours(cell_row, cell_column, dead_cells)
      ).to eq(0)
    end
  end

  context '#number_of_living_neighbours' do
    it 'returns 1 given a cell with 3 living neighbours in a certain configuration, with 2 of them dying' do
      target_cell = :live

      dead_cells = [
        [:target_cell, :live, :live],
        [:live,        :dead, :dead],
        [:dead,        :dead, :dead]
      ]

      cell_row = 1
      cell_column = 1

      expect(
        subject.number_of_living_neighbours(cell_row, cell_column, dead_cells)
      ).to eq(1)
    end
  end

end