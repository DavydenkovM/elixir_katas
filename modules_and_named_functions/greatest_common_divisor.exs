defmodule GreatestCommonDivisor do
  def gcd(x,0), do: x
  def gcd(x,y), do: gcd(y, rem(x,y))
end

IO.puts GreatestCommonDivisor.gcd(100, 0)
IO.puts GreatestCommonDivisor.gcd(0, 100)
IO.puts GreatestCommonDivisor.gcd(50, 100)
IO.puts GreatestCommonDivisor.gcd(99, 66)
IO.puts GreatestCommonDivisor.gcd(66, 99)
IO.puts GreatestCommonDivisor.gcd(66, 99)
