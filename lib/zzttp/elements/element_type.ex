defmodule Zzttp.Elements.ElementType do
  alias Zzttp.Elements.Element

  @type t ::
          :empty
          | :board_edge
          | :messenger
          | :monitor
          | :player
          | :ammo
          | :torch
          | :gem
          | :key
          | :door
          | :scroll
          | :passage
          | :duplicator
          | :bomb
          | :energizer
          | :star
          | :clockwise
          | :counter
          | :bullet
          | :water
          | :forest
          | :solid
          | :normal
          | :breakable
          | :boulder
          | :slider_ns
          | :slider_ew
          | :fake
          | :invisible
          | :blink_wall
          | :transporter
          | :line
          | :ricochet
          | :blink_ray_horizontal
          | :bear
          | :ruffian
          | :object
          | :slime
          | :shark
          | :spinning_gun
          | :pusher
          | :lion
          | :tiger
          | :blink_ray_vertical
          | :head
          | :segment
          | :invalid
          | :text_blue
          | :text_green
          | :text_cyan
          | :text_red
          | :text_purple
          | :text_brown
          | :text_black
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
end
