defmodule Zzttp.Game.GameState do
  defstruct [:current_board, :current_board_idx, :boards]

  alias Zzttp.ZztFile.Board

  @type t :: %__MODULE__{
          current_board: Board.t(),
          current_board_idx: non_neg_integer(),
          boards: [Board.t()]
        }

  def tick(%__MODULE__{current_board: board} = _state) do
    board.status_elements
    |> Enum.map(&tick/1)
  end
end
