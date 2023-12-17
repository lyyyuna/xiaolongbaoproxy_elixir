defmodule XiaolongbaoProxy.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      %{
        id: XiaolongbaoProxy.ProxyPlug,
        start: {XiaolongbaoProxy.ProxyPlug, :start_link, []},
      }
    ]

    opts = [strategy: :one_for_one, name: XiaolongbaoProxy.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
