defmodule PokerwarsPhoenixWeb.GameChannelTest do
  use PokerwarsPhoenixWeb.ChannelCase

  alias PokerwarsPhoenixWeb.GameChannel

  test("join") do
    {:ok, _, player1_socket} = join_game("game:1", "Jim")
    {:ok, _, player2_socket} = join_game("game:1", "Jane")

    ref = push player1_socket, "get_game", %{}
    assert_reply ref, :ok, player1_game

    ref = push player2_socket, "get_game", %{}
    assert_reply ref, :ok, player2_game

    assert player1_game == player2_game
  end

  def join_game(game_name, player_name) do
    socket()
      |> subscribe_and_join(GameChannel, game_name, %{player_name: player_name})
  end
end
