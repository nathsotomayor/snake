module Actions
  def self.move_snake(state)
    next_direction = state.next_direction
    next_position = calc_next_position(state)
    # verify that next box is valid
    if position_is_valid?(state, next_position)
      move_snake_to(state, next_position)
    else
      end_game(state)
    end
  end

  private

  def self.calc_next_position(state)
    current_position = state.snake.positions.first
    case state.next_direction
    when Model::Direction::UP
      # decrement row
      return Model::Coord.new(current_position.row - 1, current_position.col)
    when Model::Direction::RIGHT
      # increment col
      return Model::Coord.new(current_position.row, current_position.col + 1)
    when Model::Direction::DOWN
      # increment row
      return Model::Coord.new(current_position.row + 1, current_position.col)
    when Model::Direction::LEFT
      # decrement col
      return Model::Coord.new(current_position.row, current_position.col - 1)
    end
  end

  def self.position_is_valid?(state, position)
    # verify that it is in grid
    is_invalid = ((position.row >= state.grid.rows || position.row < 0) ||
                  (position.col >= state.grid.cols || position.col < 0))
    return false if is_invalid
    # verify that it is not overlapping the snake
    return !(state.snake.positions.include? position)
  end

  def self.move_snake_to(state, next_position)
    new_positions = [next_position] + state.snake.positions[0...-1]
    state.snake.positions = new_positions
    state
  end

  def self.end_game(state)
    state.game_finished = true
    state
  end

end
