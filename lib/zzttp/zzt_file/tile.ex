defmodule Zzttp.ZztFile.Tile do
  defstruct ~w[element color position]a

  alias Zzttp.Elements.Element

  @type position_t :: {non_neg_integer, non_neg_integer}
  @type t :: %__MODULE__{
          element: Element.t(),
          color: non_neg_integer(),
          position: position_t()
        }
end
