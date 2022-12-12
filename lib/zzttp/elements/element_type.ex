defmodule Zzttp.Elements.ElementType do
  alias Zzttp.Game.GameState
  alias Zzttp.ZztFile.Board
  alias Zzttp.ZztFile.Tile
  alias Zzttp.Elements.Element
  import Bitwise

  @color_element_types [
    :text_blue,
    :text_green,
    :text_cyan,
    :text_red,
    :text_purple,
    :text_brown,
    :text_black
  ]

  @spec element(byte) :: Element.t()
  def element(0x00),
    do: %Element{glyph: 0x20, color: 0x00, element_type: :empty, walkable: true}

  def element(0x01), do: %Element{glyph: 0x20, color: 0xFF, element_type: :board_edge}
  def element(0x02), do: %Element{glyph: 0x20, color: 0xFF, element_type: :messenger}
  def element(0x03), do: %Element{glyph: 0x20, color: 0x07, element_type: :monitor}
  def element(0x04), do: %Element{glyph: 0x02, color: 0x1F, element_type: :player}
  def element(0x05), do: %Element{glyph: 0x84, color: 0x03, element_type: :ammo}
  def element(0x06), do: %Element{glyph: 0x9D, color: 0x06, element_type: :torch}
  def element(0x07), do: %Element{glyph: 0x04, color: 0xFF, element_type: :gem}
  def element(0x08), do: %Element{glyph: 0x0C, color: 0xFF, element_type: :key}
  def element(0x09), do: %Element{glyph: 0x0A, color: 0xFE, element_type: :door}
  def element(0x0A), do: %Element{glyph: 0xE8, color: 0x0F, element_type: :scroll}
  def element(0x0B), do: %Element{glyph: 0xF0, color: 0xFE, element_type: :passage}
  def element(0x0C), do: %Element{glyph: 0xFA, color: 0x0F, element_type: :duplicator}
  def element(0x0D), do: %Element{glyph: 0x0B, color: 0xFF, element_type: :bomb}
  def element(0x0E), do: %Element{glyph: 0x7F, color: 0x05, element_type: :energizer}
  def element(0x0F), do: %Element{glyph: 0x53, color: 0x0F, element_type: :star}
  def element(0x10), do: %Element{glyph: 0x2F, color: 0xFF, element_type: :clockwise}
  def element(0x11), do: %Element{glyph: 0x5C, color: 0xFF, element_type: :counter}
  def element(0x12), do: %Element{glyph: 0xF8, color: 0x0F, element_type: :bullet}
  def element(0x13), do: %Element{glyph: 0xB0, color: 0xF9, element_type: :water}

  def element(0x14),
    do: %Element{glyph: 0xB0, color: 0x20, element_type: :forest, walkable: true}

  def element(0x15), do: %Element{glyph: 0xDB, color: 0xFF, element_type: :solid}
  def element(0x16), do: %Element{glyph: 0xB2, color: 0xFF, element_type: :normal}
  def element(0x17), do: %Element{glyph: 0xB1, color: 0xFF, element_type: :breakable}
  def element(0x18), do: %Element{glyph: 0xFE, color: 0xFF, element_type: :boulder}
  def element(0x19), do: %Element{glyph: 0x12, color: 0xFF, element_type: :slider_ns}
  def element(0x1A), do: %Element{glyph: 0x1D, color: 0xFF, element_type: :slider_ew}

  def element(0x1B),
    do: %Element{glyph: 0xB2, color: 0xFF, element_type: :fake, walkable: true}

  def element(0x1C), do: %Element{glyph: 0xB0, color: 0xFF, element_type: :invisible}
  def element(0x1D), do: %Element{glyph: 0xCE, color: 0xFF, element_type: :blink_wall}
  def element(0x1E), do: %Element{glyph: 0xC5, color: 0xFF, element_type: :transporter}
  def element(0x1F), do: %Element{glyph: 0xCE, color: 0xFF, element_type: :line}
  def element(0x20), do: %Element{glyph: 0x2A, color: 0x0A, element_type: :ricochet}

  def element(0x21),
    do: %Element{glyph: 0xCD, color: 0xFF, element_type: :blink_ray_horizontal}

  def element(0x22), do: %Element{glyph: 0x99, color: 0x06, element_type: :bear}
  def element(0x23), do: %Element{glyph: 0x05, color: 0x0D, element_type: :ruffian}
  def element(0x24), do: %Element{glyph: 0x02, color: 0xFF, element_type: :object}
  def element(0x25), do: %Element{glyph: 0x2A, color: 0xFF, element_type: :slime}
  def element(0x26), do: %Element{glyph: 0x5E, color: 0x07, element_type: :shark}

  def element(0x27),
    do: %Element{glyph: 0x18, color: 0xFF, element_type: :spinning_gun}

  def element(0x28), do: %Element{glyph: 0x10, color: 0xFF, element_type: :pusher}
  def element(0x29), do: %Element{glyph: 0xEA, color: 0x0C, element_type: :lion}
  def element(0x2A), do: %Element{glyph: 0xE3, color: 0x0B, element_type: :tiger}

  def element(0x2B),
    do: %Element{glyph: 0xBA, color: 0xFF, element_type: :blink_ray_vertical}

  def element(0x2C), do: %Element{glyph: 0xE9, color: 0xFF, element_type: :head}
  def element(0x2D), do: %Element{glyph: 0x4F, color: 0xFF, element_type: :segment}
  def element(0x2E), do: %Element{glyph: 0x20, color: 0xFF, element_type: :invalid}
  def element(0x2F), do: %Element{glyph: 0x20, color: 0x1F, element_type: :text_blue}
  def element(0x30), do: %Element{glyph: 0x20, color: 0x2F, element_type: :text_green}
  def element(0x31), do: %Element{glyph: 0x20, color: 0x3F, element_type: :text_cyan}
  def element(0x32), do: %Element{glyph: 0x20, color: 0x4F, element_type: :text_red}
  def element(0x33), do: %Element{glyph: 0x20, color: 0x5F, element_type: :text_purple}
  def element(0x34), do: %Element{glyph: 0x20, color: 0x6F, element_type: :text_brown}
  def element(0x35), do: %Element{glyph: 0x20, color: 0x0F, element_type: :text_black}

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
        position: position
      })
      when element_type == :object do
    board
    |> Board.status_element_at(position)
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
  def color(%Element{element_type: type, color: color}, _) when type in @color_element_types,
    do: to_class(color)

  # Choose any color
  def color(%Element{color: 0xFF}, color), do: to_class(color)

  # Special: Choose any FG color on white
  def color(%Element{color: 0xFE}, color), do: to_class((color &&& 0xF0) + 0xF)

  # Special: ???
  def color(%Element{color: mask}, _) when mask < 0x0F, do: to_class(mask &&& 0xF)

  def color(%Element{color: mask}, color) do
    case {mask >>> 4, mask &&& 0x0F} do
      {0xF, fg} -> color &&& 0xF0 + fg
      {bg, 0xF} -> (bg <<< 4) + color &&& 0x0F
      _ -> mask
    end
    |> to_class()
  end

  @spec to_class(non_neg_integer()) :: String.t()
  defp to_class(color) do
    "c#{color |> Integer.to_string(16) |> String.pad_leading(2, "0")}"
    |> String.downcase()
  end
end
