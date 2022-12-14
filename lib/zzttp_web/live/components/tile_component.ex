defmodule ZzttpWeb.Components.TileComponent do
  use Phoenix.Component

  alias Zzttp.Elements.ElementType
  alias Zzttp.Game.GameState
  alias Zzttp.ZztFile.Tile

  attr :tile, Tile, required: true
  attr :game_state, GameState, required: true

  def tile(assigns) do
    ~H"""
    <span class={color(@tile)}>&#x<%= glyph(@game_state, @tile) %>;</span>
    """
  end

  @spec color(Tile.t()) :: String.t()
  defp color(%Tile{element: element, color: color}), do: ElementType.color(element, color)

  @spec glyph(GameState.t(), Tile.t()) :: String.t()
  defp glyph(%GameState{} = game_state, %Tile{} = tile), do: ElementType.glyph(game_state, tile)
end
