defmodule PokerwarsPhoenixWeb.GameChannel do
  use PokerwarsPhoenixWeb, :channel
  alias Pokerwars.Player
  alias PokerwarsPhoenix.GameServer

  def join("game:" <> _ = game_name, %{player_name: player_name}, socket) do
    {:ok, _pid } = GameServer.find_or_create(game_name)

    player = Player.create(player_name)
    GameServer.apply_action(game_name, {:join, player})

    {:ok, assign(socket, :game_name, game_name)}
  end

  def handle_in("get_game", %{}, socket) do
    game = GameServer.get(socket.assigns.game_name)
    {:reply, {:ok, game}, socket}
  end
end
