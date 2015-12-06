defmodule Calculator do
  def sum(list), do: _sum(list, 0)

  def _sum([], total), do: total
  def _sum([head | tail], total), do: _sum(tail, total+head)

  defmodule WithoutAcc do
    def sum(list), do: _sum(list)

    def _sum([]), do: 0
    def _sum([head | tail]), do: head + _sum(tail)
  end
end

IO.puts Calculator.sum([1,2,3,4,5])
IO.puts Calculator.WithoutAcc.sum([1,2,3,4,5])
