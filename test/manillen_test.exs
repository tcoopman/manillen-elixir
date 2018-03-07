defmodule ManillenTest do
  use ExUnit.Case
  doctest Manillen

  test "Start a new game" do
    assert {:ok, _pid} = Manillen.start_link()
  end

  describe "Validate a trick" do
    setup do
      Manillen.start_link()

      :ok
    end

    test "A first valid move" do
      :ok = Manillen.play(:player1, {:hearts, :eight})
    end
  end
end
