defmodule SimpleSum do
  def sum(0) do
    0
  end
  
  def sum(n) do
    n + sum(n-1)
  end
end

IO.puts SimpleSum.sum(100)
