defmodule AdventOfCode.Day01 do

    def part1(args) do
      args
      |> String.split("\n", trim: true)
      |> Enum.map(&String.to_integer/1)
      |> combine(2)
      |> Enum.find(&(Enum.sum(&1) == 2020))
      |> List.flatten()
      |> Enum.reduce(1, &(&2 * &1))
    end

    def combine(input, len)
    def combine(_, 0), do: [[]]
    def combine([], _), do: []

    def combine([h | t], len),
      do: Enum.map(combine(t, len - 1), &[h | &1]) ++ combine(t, len)


    def part2(args) do
      args
      |> String.split("\n", trim: true)
      |> Enum.map(&String.to_integer/1)
      |> combine(3)
      |> Enum.find(&(Enum.sum(&1) == 2020))
      |> List.flatten()
      |> Enum.reduce(1, &(&2 * &1))
    end
  end
