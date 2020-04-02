defmodule ExerciseModuleFunctions do
  @moduledoc """
  this module, contains functions that determines if the guess is the actual value
  within a given range 
  """

  @doc """
  will output a string of each guess given within a given range
  """

  def guess(actual, range) when is_integer(range) do
    actual
  end

  def guess(actual, range) do
    new_range =
      _middle_value(range)
      |> _shade_values(actual, range)

    IO.puts("Is it #{_compare_range(new_range, range)}")

    guess(actual, new_range)
  end

  defp _middle_value(1..b) do
    (b / 2) |> round()
  end

  defp _middle_value(a..b) do
    (a + (b - a) / 2) |> round()
  end

  defp _shade_values(guess, actual, a.._b) when actual < guess, do: a..guess

  defp _shade_values(guess, actual, _a..b) when actual > guess, do: guess..b

  defp _shade_values(guess, actual, _range) when actual == guess, do: guess

  defp _compare_range(new_range, _range) when is_integer(new_range), do: new_range

  defp _compare_range(a..b, c.._d) when a == c, do: b

  defp _compare_range(a..b, _c..d) when b == d, do: a
end
