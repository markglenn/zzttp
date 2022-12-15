defmodule ZzttpWeb.GameLive do
  use ZzttpWeb, :live_view

  alias Zzttp.Game.GameState
  alias ZzttpWeb.Components.TileComponent

  @tick_rate 110

  def mount(_params, _session, socket) do
    boards = Zzttp.ZztFile.load("priv/zzt/TOWN.ZZT")

    state = %GameState{boards: boards, current_board_idx: 0, current_board: Enum.at(boards, 0)}

    start_timer()

    socket =
      socket
      |> assign(:game_state, state)
      |> assign(:counter, 0)

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <main class="game-board">
      <%= for y <- 1..25, x <- 1..60 do %>
        <TileComponent.tile tile={@game_state.current_board.tiles[{x, y}]} game_state={@game_state} />
      <% end %>
    </main>
    <%= @counter %>
    """
  end

  def handle_info(:tick, socket) do
    count = socket.assigns.counter + 1
    {:noreply, assign(socket, :counter, count)}
  end

  defp start_timer do
    :timer.send_interval(@tick_rate, :tick)
  end
end
