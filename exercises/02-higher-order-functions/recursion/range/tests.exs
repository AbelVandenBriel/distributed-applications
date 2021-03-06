ExUnit.start()

file = System.get_env("DA_TESTFILE") || "student.exs"
Code.load_file(file, __DIR__)


defmodule Tests do
  use ExUnit.Case, async: true

  data = [
    {1, 1, []},
    {1, 2, [1]},
    {1, 3, [1, 2]},
    {1, 0, []},
    {0, -5, []},
    {2, 8, [2, 3, 4, 5, 6, 7]},
  ]

  for {a, b, expected} <- data do
    @a a
    @b b
    @expected expected

    test "range(#{a}, #{b}) should return #{expected}" do
      assert Exercise.range(@a, @b) == @expected
    end
  end
end
