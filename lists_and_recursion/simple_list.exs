defmodule SimpleList do
  def mapsum([], _func), do: 0
  def mapsum([head | tail], func), do: func.(head) + mapsum(tail, func)

  def max([head | tail]), do: _max(tail, head)
  defp _max([], greatest), do: greatest
  defp _max([head | tail], greatest), do: _max(tail, _max(head, greatest))
  defp _max(a, b) when b > a, do: b
  defp _max(a, _), do: a

  def caesar([], _), do: []
  def caesar([head | tail], offset) when head + offset < ?z, do: [head + offset  | caesar(tail, offset)]
  def caesar([head | tail], offset), do: [head + offset - 26  | caesar(tail, offset)]

  def span(from, to), do: _span(from, to, [])
  defp _span(from, to, acc) when from < to do
    _span(from + 1, to, [from | acc])
  end
  defp _span(_, to, acc), do: Enum.reverse([ to | acc])
end

IO.puts SimpleList.mapsum([1, 2, 3, 4, 5], &(&1 * &1))
IO.puts SimpleList.max([1, 2, 5, 4, 3])
IO.puts SimpleList.caesar('ryvkve', 13)
IO.inspect SimpleList.span(5, 15)
