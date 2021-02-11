defmodule PhxCrudUsers.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      PhxCrudUsers.Repo,
      # Start the Telemetry supervisor
      PhxCrudUsersWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: PhxCrudUsers.PubSub},
      # Start the Endpoint (http/https)
      PhxCrudUsersWeb.Endpoint
      # Start a worker by calling: PhxCrudUsers.Worker.start_link(arg)
      # {PhxCrudUsers.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhxCrudUsers.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    PhxCrudUsersWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
