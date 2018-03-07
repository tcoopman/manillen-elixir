defmodule Manillen do
  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, nil, name: :manillen)
  end

  def play(player, card) do
    GenServer.call(:manillen, {:play, player, card})
  end

  def handle_call({:play, _player, _card}, _from, state) do
    {:reply, :ok, state}
  end

  # def validate_trick([_, _, _, _] = cards) do
  #   unique_cards = Enum.uniq(cards)

  #   case unique_cards == cards do
  #     false -> {:error, :duplicate_card}
  #     true -> :ok
  #   end
  # end

  # def validate_trick(_), do: {:error, :incorrect_number_of_moves}
end
