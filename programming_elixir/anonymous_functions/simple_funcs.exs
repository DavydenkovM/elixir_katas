list_concat = fn list_1, list_2 ->
  list_1 ++ list_2
end

sum = fn a, b, c ->
  a + b + c
end

pair_tuple_to_list = fn tuple ->
  Tuple.to_list(tuple)
end

IO.puts(List.to_string(list_concat.([:a, :b], [:c, :d]) |> Enum.map &to_string(&1)))
IO.puts sum.(1,2,3)
IO.puts pair_tuple_to_list.({ 1234, 5678 })
