defmodule Sum do
  def values(dict) do
    dict |> Dict.values |> Enum.sum
  end
end

hd = [one: 1, two: 2, three: 3] |> Enum.into HashDict.new
IO.puts Sum.values(hd)

map = %{ four: 4, five: 5, six: 6 }
IO.puts Sum.values(map)

# dict api

IO.inspect kw_list = [name: "Dave", likes: "Programming", where: "Dallas", abc: "wer"]
hashdict = Enum.into kw_list, HashDict.new
map = Enum.into kw_list, Map.new

IO.inspect hashdict
IO.inspect map

IO.puts kw_list[:name]
IO.puts hashdict[:likes]
IO.puts map[:where]

hashdict = Dict.drop(hashdict, [:where, :likes])
hashdict = Dict.put(hashdict, :also_likes, "Ruby")

IO.inspect hashdict

combo = Dict.merge(map, hashdict)
combo2 = Dict.merge(hashdict, map)

IO.inspect combo
IO.inspect combo2

# value duplication

kw_list = [name: "Dave", likes: "Programming", likes: "Elixir"]
IO.puts kw_list[:likes]
IO.inspect Dict.get(kw_list, :likes)
IO.inspect Keyword.get_values(kw_list, :likes)
