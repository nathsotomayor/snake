module Actions
  def self.move_snake(state)
    next_direction = state.next_direction
    next_position = calc_next_position(state)
    # verify that next box is valid
    if position is valid?(state, next_position)
      move_snake_to(state, next_position)
    else
      end_game(state)
    end
  end

  private

  def calc_next_position
    current_position = state.snake.positions.first
    case state.next_direction
    when UP
      # decrement row
      return Model::Coord.new(current_position.row - 1, current_position.col)
    when RIGHT
      # increment col
      return Model::Coord.new(current_position.row, current_position.col + 1)
    when DOWN
      # increment row
      return Model::Coord.new(current_position.row + 1, current_position.col)
    when LEFT
      # decrement col
      return Model::Coord.new(current_position.row, current_position.col - 1)
    end
  end

  

end
