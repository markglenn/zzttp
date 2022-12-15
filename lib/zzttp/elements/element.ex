defmodule Zzttp.Elements.Element do
  defstruct [:element_type, :glyph, :color, walkable: false]

  import Bitwise
  alias Zzttp.Game.GameState
  alias Zzttp.ZztFile.Board
  alias Zzttp.ZztFile.Tile

  @type t :: %__MODULE__{
          element_type: ElementType.t(),
          glyph: arity,
          color: arity,
          walkable: boolean
        }

  @color_element_types [
    :text_blue,
    :text_green,
    :text_cyan,
    :text_red,
    :text_purple,
    :text_brown,
    :text_black
  ]

  @spec glyph(GameState.t(), Tile.t()) :: String.t()
  def glyph(%GameState{current_board_idx: 0}, %Tile{element: %{element_type: :player}}) do
    0x20
    |> Zzttp.Cp437.from_cp437()
    |> Integer.to_string(16)
    |> String.pad_leading(4, "0")
  end

  def glyph(_game_state, %Tile{element: %{element_type: element_type}, color: glyph})
      when element_type in @color_element_types do
    glyph
    |> Zzttp.Cp437.from_cp437()
    |> Integer.to_string(16)
    |> String.pad_leading(4, "0")
  end

  def glyph(%GameState{current_board: board}, %Tile{
        element: %{element_type: element_type},
        location: location
      })
      when element_type == :object do
    board
    |> Board.status_element_at(location)
    |> Map.get(:p1)
    |> Zzttp.Cp437.from_cp437()
    |> Integer.to_string(16)
    |> String.pad_leading(4, "0")
  end

  def glyph(_game_state, %Tile{element: %{glyph: glyph}}) do
    glyph
    |> Zzttp.Cp437.from_cp437()
    |> Integer.to_string(16)
    |> String.pad_leading(4, "0")
  end

  @spec color(Element.t(), non_neg_integer()) :: String.t()
  def color(%__MODULE__{element_type: type, color: color}, _) when type in @color_element_types,
    do: to_class(color)

  # Choose any color
  def color(%__MODULE__{color: 0xFF}, color), do: to_class(color)

  # Special: Choose any FG color on white
  def color(%__MODULE__{color: 0xFE}, color), do: to_class((color &&& 0xF0) + 0xF)

  # Special: ???
  def color(%__MODULE__{color: mask}, _) when mask < 0x0F, do: to_class(mask &&& 0xF)

  def color(%__MODULE__{color: mask}, color) do
    case {mask >>> 4, mask &&& 0x0F} do
      {0xF, fg} -> color &&& 0xF0 + fg
      {bg, 0xF} -> (bg <<< 4) + color &&& 0x0F
      _ -> mask
    end
    |> to_class()
  end

  @spec to_class(non_neg_integer()) :: String.t()
  defp to_class(color) do
    "c#{Integer.to_string(color, 16) |> String.pad_leading(2, "0")}"
    |> String.downcase()
  end
end
