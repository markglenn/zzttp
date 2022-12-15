defmodule Zzttp.Game.ElementTicks do
  alias Zzttp.ZztFile.Tile
  alias Zzttp.ZztFile.Board

  @doc """
  Calculate a direction of 1 cell in any cardinal direction
  """
  @spec calculate_direction_random :: {integer, integer}
  def calculate_direction_random do
    case :rand.uniform(3) - 2 do
      0 -> {0, (:rand.uniform(2) - 1) * 2 - 1}
      x -> {x, 0}
    end
  end

  def calculate_new_location({offset_x, offset_y}, %Tile{location: {x, y}}),
    do: {x + offset_x, y + offset_y}

  def element_tick(%Board{} = board, :lion, tile, _status_element) do
    location =
      calculate_direction_random()
      |> calculate_new_location(tile)

    tiles =
      case board.tiles[location] do
        %{element: %{walkable: true}} ->
          board.tiles

        _ ->
          board.tiles
      end

    %{board | tiles: tiles}
  end

  def element_tick(%Board{} = board, _, _tile, _status_element), do: board
end
