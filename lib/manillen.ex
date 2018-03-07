defmodule Manillen do
  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, [], name: :manillen)
  end

  def play(player, card) do
    GenServer.call(:manillen, {:play, player, card})
  end

  def handle_call({:play, player, card}, _from, state) do
    new_state = [{player, card} | state]
    cond do
      duplicate_player(new_state) -> {:reply, {:error, :await_turn}, state}
      duplicate_card(new_state) -> {:reply, {:error, :duplicate_card}, state}
      true -> {:reply, :ok, new_state}
    end
  end

  defp duplicate_player(state) do
    players = Enum.map(state, fn {player, _} -> player end)
    last_players = Enum.chunk_every(players, 4) |> List.last()
    last_players != Enum.uniq(last_players)
  end

  defp duplicate_card(state) do
    cards = Enum.map(state, fn {_, card} -> card end)
    cards != Enum.uniq(cards)
  end

end
