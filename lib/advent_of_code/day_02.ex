defmodule AdventOfCode.Day02 do
  def part1(args) do
    args
    |> String.split("\n", trim: true)
    |> Enum.map(fn x -> String.split(x, " ") end)
    |> Enum.filter(fn [range, letter, pass] ->
      [low, high] = String.split(range, "-")
      count = pass |> String.graphemes() |> Enum.count(&(&1 == String.at(letter, 0)))
      count >= String.to_integer(low) && count <= String.to_integer(high)
    end)
    |> length()
  end

  def part2(args) do
    args
    |> String.split("\n", trim: true)
    |> Enum.map(fn x -> String.split(x, " ") end)
    |> Enum.filter(fn [range, letter, pass] ->
      [low_index, high_index] = String.split(range, "-")
      letter = String.at(letter, 0)
      low = String.at(pass, String.to_integer(low_index) - 1)
      high = String.at(pass, String.to_integer(high_index) - 1)
      low === letter != (high === letter)
    end)
    |> length()

  end
end
