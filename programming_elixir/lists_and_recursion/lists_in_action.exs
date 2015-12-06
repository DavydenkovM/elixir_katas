defmodule ListsInAction do
  def concat(list1, list2), do: list1 ++ list2

  def flatten(list), do: List.flatten(list)

  def foldl(list), do: List.foldl(list, "", fn(val, acc) -> "#{val}(#{acc})" end)
  def foldr(list), do: List.foldr(list, "", fn(val, acc) -> "#{val}(#{acc})" end)

  def zip(list), do: List.zip(list)
  def unzip(list), do: :lists.unzip(list)
end

IO.inspect ListsInAction.concat([1,2,3], [3,4,5])
IO.inspect ListsInAction.flatten([1,2,[3], [[4]]])
IO.inspect ListsInAction.foldl([1,2,3])
IO.inspect ListsInAction.foldr([1,2,3])
l = ListsInAction.zip([[1,2,3], [:a, :b, :c], ["cat", "dog"]])
IO.inspect l

kv = [{:name, "Dave"}, {:likes, "Programming"}, {:where, "Dallas", "TX"}]
IO.inspect List.keyfind(kv, "Dallas", 1)
IO.inspect List.keyfind(kv, "TX", 2)
IO.inspect List.keyfind(kv, "TX", 1)
IO.inspect List.keyfind(kv, "TX", 1)

IO.inspect List.keydelete(kv, "TX", 2)

IO.inspect List.keyreplace(kv, :name, 0, {:first_name, "Dave"})
