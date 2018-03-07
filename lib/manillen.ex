defmodule Manillen do
  def validate_trick(cards) do
    unique_cards = Enum.uniq(cards)

    case Enum.count(unique_cards) == Enum.count(cards) do
      false -> {:error, :duplicate_card}
      true -> :ok
    end
  end
end
