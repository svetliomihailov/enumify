defmodule EnumifyTest do
  use ExUnit.Case

  defmodule TestEnumType do
    use Enumify, apples: 0, oranges: 1, bananas: 2
  end

  test "type/0 returns the base ecto type" do
    assert TestEnumType.type() == :integer
  end

  test "cast/1 with a string value in the list" do
    assert {:ok, :apples} = TestEnumType.cast("apples")
  end

  test "cast/1 with an integer representation of the value" do
    assert {:ok, :apples} = TestEnumType.cast(0)
  end

  test "cast/1 with an atom representation of a string in the list" do
    assert {:ok, :apples} = TestEnumType.cast(:apples)
  end

  test "cast/1 with a string value outside of the list" do
    assert :error = TestEnumType.cast("mango")
  end

  test "cast/1 with an atom representation of a string value outside of the list" do
    assert :error = TestEnumType.cast(:mango)
  end

  test "cast/1 with an integer as input" do
    assert {:ok, :oranges} = TestEnumType.cast(1)
  end

  test "cast/1 with an float as input" do
    assert :error = TestEnumType.cast(1.1)
  end

  test "cast/1 with a map as input" do
    assert :error = TestEnumType.cast(%{})
  end

  test "cast/1 with a list as input" do
    assert :error = TestEnumType.cast([])
  end

  test "load/1 with an integer value inside of the list" do
    assert {:ok, :bananas} = TestEnumType.load(2)
  end

  test "load/1 with an integer value outside of the list" do
    assert_raise FunctionClauseError, fn -> TestEnumType.load(5) end
  end

  test "load/1 with a string input" do
    assert_raise FunctionClauseError, fn -> TestEnumType.load("5") end
  end

  test "load/1 with a map input" do
    assert_raise FunctionClauseError, fn -> TestEnumType.load(%{}) end
  end

  test "load/1 with a list input" do
    assert_raise FunctionClauseError, fn -> TestEnumType.load([]) end
  end

  test "dump/1 with a string value in the list" do
    assert {:ok, 0} = TestEnumType.dump("apples")
  end

  test "dump/1 with an atom representation of a string in the list" do
    assert {:ok, 0} = TestEnumType.dump(:apples)
  end

  test "dump/1 with a integer representation of a value in the list" do
    assert {:ok, 0} = TestEnumType.dump(0)
  end

  test "dump/1 with a string value outside of the list" do
    assert :error = TestEnumType.dump("mango")
  end

  test "dump/1 with an atom representation of a string value outside of the list" do
    assert :error = TestEnumType.dump(:mango)
  end

  test "dump/1 with an integer as input" do
    assert {:ok, 1} = TestEnumType.dump(1)
  end

  test "dump/1 with an float as input" do
    assert :error = TestEnumType.dump(1.1)
  end

  test "dump/1 with a map as input" do
    assert :error = TestEnumType.dump(%{})
  end

  test "dump/1 with a list as input" do
    assert :error = TestEnumType.dump([])
  end

  test "equal?/2 returns true with an atom and string representations of the same value" do
    assert TestEnumType.equal?(:apples, "apples")
  end

  test "equal?/2 returns true with an atom and integer representations of the same value" do
    assert TestEnumType.equal?(:apples, 0)
  end

  test "equal?/2 returns true with an integer and string representations of the same value" do
    assert TestEnumType.equal?(0, "apples")
  end

  test "equal?/2 returns false when terms are semanticall unequal" do
    refute(TestEnumType.equal?(0, "oranges"))
  end

  test "__keys__/0" do
    assert [:apples, :oranges, :bananas] = TestEnumType.__keys__()
  end

  test "__values__/0" do
    assert [0, 1, 2] = TestEnumType.__values__()
  end

  test "__mapping__/0" do
    assert [apples: 0, oranges: 1, bananas: 2] = TestEnumType.__mapping__()
  end
end
