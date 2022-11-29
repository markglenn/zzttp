defmodule ZzttpWeb.PageController do
  use ZzttpWeb, :controller

  def home(conn, _params) do
    Zzttp.ZztFile.load("priv/zzt/TOWN.ZZT")
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end
end
