defmodule ManillenTest do
  use ExUnit.Case
  doctest Manillen

  test "Start a new game" do
    assert {:ok, _pid} = Manillen.start_link()
  end

  describe "Validate a trick" do
    setup do
      {:ok, _pid} = Manillen.start_link()

      :ok
    end

    test "A first valid move" do
      assert :ok = Manillen.play(:player1, {:hearts, :eight})
    end

    test "A second valid move" do
      assert :ok = Manillen.play(:player1, {:hearts, :eight})
      assert :ok = Manillen.play(:player2, {:hearts, :seven})
    end

    test "The second player cannot play the same card" do
      :ok = Manillen.play(:player1, {:hearts, :eight})
      assert {:error, :duplicate_card} == Manillen.play(:player2, {:hearts, :eight})
    end

    test "The same card cannot be played twice" do
      card = {:hearts, :eight}
      :ok = Manillen.play(:player1, card)
      :ok = Manillen.play(:player2, {:hearts, :seven})
      :ok = Manillen.play(:player3, {:hearts, :nine})
      assert {:error, :duplicate_card} == Manillen.play(:player4, card)
    end

    test "A player cannot play twice in a row" do
      assert :ok = Manillen.play(:player1, {:hearts, :eight})
      assert {:error, :await_turn} == Manillen.play(:player1, {:hearts, :seven})
    end
  end
end
