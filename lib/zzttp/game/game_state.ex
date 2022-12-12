defmodule Zzttp.Game.GameState do
  defstruct [:current_board, :current_board_idx, :boards]

  alias Zzttp.ZztFile.Board

  @type t :: %__MODULE__{
          current_board: Board.t(),
          current_board_idx: non_neg_integer(),
          boards: [Board.t()]
        }
end
