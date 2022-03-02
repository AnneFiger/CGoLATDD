class GameOfLife
  def get_next_grid(current_grid)
    new_grid = current_grid

    new_grid.each_with_index do |row, row_index|
      row.each_with_index do |cell, column_index|
        living_neighbours_count = number_of_living_neighbours(row_index, column_index, new_grid)
        new_state_of_cell(cell, living_neighbours_count)
      end
    end
  end

  def new_state_of_cell(cell, living_neighbours_count)
    if cell == :live && living_neighbours_count <= 1 
      cell = :dead
      return cell

    elsif cell == :live && living_neighbours_count > 3 
        cell = :dead
        return cell 
    else
      cell
    end
  end

  def number_of_living_neighbours(cell_row, cell_column, grid)
    0
  end
end
