map = %{ a: 1, b: 2, c: 3 }

map_2 = %{ map | b: "two", c: "three" }
map_3 = %{ map_2 | a: 1 }

map_4 = Dict.put_new(map_3, :d, 1)

IO.inspect [map, map_2, map_3, map_4]
