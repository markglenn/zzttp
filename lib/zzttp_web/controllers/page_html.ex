defmodule ZzttpWeb.PageHTML do
  use ZzttpWeb, :html

  alias Zzttp.Elements.ElementType
  alias Zzttp.Game.GameState
  alias Zzttp.ZztFile.Tile

  embed_templates "page_html/*"

  @spec color(Tile.t()) :: String.t()
  def color(%Tile{element: element, color: color}), do: ElementType.color(element, color)

  @spec glyph(GameState.t(), Tile.t()) :: binary
  def glyph(%GameState{} = game_state, %Tile{} = tile),
    do: ElementType.glyph(game_state, tile)
end
