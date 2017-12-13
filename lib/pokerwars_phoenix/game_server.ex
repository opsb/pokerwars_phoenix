defmodule PokerwarsPhoenix.GameServer do
  alias Pokerwars.Game
  alias Pokerwars.Deck

  def exist?(name) do
    Process.whereis(agent_id(name))
  end

  def find_or_create(name) do
    case exist?(name) do
      nil -> start_link(name)
      pid -> {:ok, pid}
    end
  end

  def start_link(name) do
    Agent.start_link(fn -> new_game end, name: agent_id(name))
  end

  def apply_action(name, action) do
    Agent.update(agent_id(name), fn game ->
      {:ok, updated_game} = Game.apply_action(game, action)
      updated_game
    end)
  end

  def get(name) do
    Agent.get(agent_id(name), &(&1))
  end

  defp new_game do
    deck = Deck.in_order |> Deck.shuffle
    {:ok, game} = Game.create(deck)
    game
  end

  defp agent_id(name) when is_binary(name) do
    String.to_atom(name)
  end
end
