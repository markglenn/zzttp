defmodule Zzttp.Elements.Element do
  defstruct [:element_type, :glyph, :color, walkable: false, draw: nil]

  alias Zzttp.ZztFile.Board

  @type t :: %__MODULE__{
          element_type: element_type_t,
          glyph: arity,
          color: arity,
          walkable: boolean,
          draw: (Board.t(), t(), non_neg_integer, non_neg_integer -> non_neg_integer) | nil
        }

  @type element_type_t ::
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
end
