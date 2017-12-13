defmodule PokerwarsPhoenixWeb.PageController do
  use PokerwarsPhoenixWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
