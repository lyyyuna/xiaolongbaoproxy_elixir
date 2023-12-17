defmodule XiaolongbaoProxy.ProxyPlug do
  require Logger
  use Plug.Builder

  @port Application.compile_env :xiaolongbaoproxy_elixir, :port

  plug Plug.Logger
  plug :hello

  def start_link do
    Plug.Cowboy.http __MODULE__, [], port: @port
  end

  def hello(conn, _opts) do
    Logger.info("hello")
    conn
  end
end
