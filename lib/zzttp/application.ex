defmodule Zzttp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      ZzttpWeb.Telemetry,
      # Start the Ecto repository
      Zzttp.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Zzttp.PubSub},
      # Start Finch
      {Finch, name: Zzttp.Finch},
      # Start the Endpoint (http/https)
      ZzttpWeb.Endpoint
      # Start a worker by calling: Zzttp.Worker.start_link(arg)
      # {Zzttp.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Zzttp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ZzttpWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
