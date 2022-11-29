defmodule Zzttp.Repo do
  use Ecto.Repo,
    otp_app: :zzttp,
    adapter: Ecto.Adapters.Postgres
end
