defmodule Consulate.Application do
  use Application

  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: Consulate.Server, options: [port: 8080]}
    ]

    opts = [strategy: :one_for_one, name: Consulate.Supervisor]

    Supervisor.start_link(children, opts)
  end
end
