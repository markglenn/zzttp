defmodule ZzttpWeb.PageController do
  alias Zzttp.Game.GameState
  use ZzttpWeb, :controller

  @spec home(Plug.Conn.t(), any) :: Plug.Conn.t()
  def home(conn, _params) do
    boards = Zzttp.ZztFile.load("priv/zzt/TOWN.ZZT")

    state = %GameState{boards: boards, current_board_idx: 0, current_board: Enum.at(boards, 0)}
    render(conn, :home, layout: false, game_state: state)
  end
end
