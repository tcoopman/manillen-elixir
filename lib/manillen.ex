defmodule Manillen do
  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, [], name: :manillen)
  end

  def play(player, card) do
    GenServer.call(:manillen, {:play, player, card})
  end

  def handle_call({:play, player, card}, _from, state) do
    case state do
      [] -> {:reply, :ok, [{player, card}]}
      [{^player, _}] -> {:reply, {:error, :await_turn}, state}
      [{_, ^card}] -> {:reply, {:error, :duplicate_card}, state}
      _ -> {:reply, :ok, [player | state]}
    end
    
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
