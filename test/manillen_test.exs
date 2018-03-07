defmodule ManillenTest do
  use ExUnit.Case
  doctest Manillen

  describe "Validate a trick" do
    test "valid trick" do
      assert :ok ==
               Manillen.validate_trick([
                 {:hearts, :manille},
                 {:hearts, :seven},
                 {:hearts, :eight},
                 {:hearts, :nine}
               ])
    end

    test "invalid trick" do
      assert {:error, :duplicate_card} ==
               Manillen.validate_trick([
                 {:hearts, :manille},
                 {:hearts, :manille},
                 {:hearts, :eight},
                 {:hearts, :nine}
               ])
    end

    test "invalid trick, not enough moves" do
      assert {:error, :incorrect_number_of_moves} =
        Manillen.validate_trick([])
    end
  end
end
