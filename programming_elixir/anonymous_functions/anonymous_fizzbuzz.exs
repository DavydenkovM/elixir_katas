strange_fizzbuzz = fn
  0, 0, _ -> "FizzBuzz"
  0, _, _ -> "Fizz"
  _, 0, _ -> "Buzz"
  _, _, third_arg -> "#{third_arg}"
end

fizzbuzz = fn n ->
  strange_fizzbuzz.(rem(n,3), rem(n,5), n)
end

IO.puts Enum.map(1..15, &fizzbuzz.(&1))
