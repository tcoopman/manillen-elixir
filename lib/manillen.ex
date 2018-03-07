defmodule Manillen do

  def validate_trick([_, _, _, _] = cards) do
    unique_cards = Enum.uniq(cards)

    case unique_cards == cards do
      false -> {:error, :duplicate_card}
      true -> :ok
    end
  end

  def validate_trick(_), do: {:error, :incorrect_number_of_moves}
end
