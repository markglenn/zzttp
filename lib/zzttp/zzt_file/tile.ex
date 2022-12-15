defmodule Zzttp.ZztFile.Tile do
  defstruct ~w[element color location]a

  alias Zzttp.ZztFile.Board
  alias Zzttp.Elements.Element

  @type t :: %__MODULE__{
          element: Element.t(),
          color: non_neg_integer(),
          location: Board.location_t()
        }
end
