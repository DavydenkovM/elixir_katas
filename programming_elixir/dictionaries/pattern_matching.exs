# Keyword - for duplicated keys
# Keyword - to ensure the elements are ordered
# Need pattern matching? - use Maps
# Lots of elements?- use HashDicts, because Maps are slow in R17

person = %{ name: "Dave", height: 1.88 }
%{ name: a_name } = person

IO.puts a_name

IO.inspect %{ name: _, height: _ } = person
IO.inspect %{ name: "Dave", height: _ } = person
# IO.inspect %{ name: "Not Dave", height: _ } = person
# IO.inspect %{ name: "Dave", weight: _ } = person


IO.inspect '------'
people = [
  %{ name: "Dave", height: 1.24 },
  %{ name: "Grumpy", height: 1.88 },
  %{ name: "Dopey", height: 1.32 },
  %{ name: "Shaquille", height: 2.16 },
  %{ name: "Sneezy", height: 1.28 },
]

for person = %{ height: height } <- people,
  height > 1.5,
  do: IO.inspect person
