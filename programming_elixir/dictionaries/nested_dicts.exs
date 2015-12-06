defmodule Customer do
  defstruct name: "", company: ""
end

defmodule BugReport do
  defstruct owner: %{}, details: "", severity: 1
end

authors = [
  %{ name: "Jose", language: "Elixir" },
  %{ name: "Matz", language: "Ruby" },
  %{ name: "Larry", language: "Perl" },
]

languages_with_an_r = fn (:get, collection, next_fn) ->
  for row <- collection do
    if String.contains?(row.language, "r") do
      next_fn.(row)
    end
  end
end

IO.inspect get_in(authors, [languages_with_an_r, :name])

# 1. Ugly way of updating key value:
# report = %BugReport{ report | owner: %Customer{ report.owner | company: "PragProg"  } }  

# 2. Using macros:
# put_in(report.owner.company, "PragProg2")

# 3. Applying funcs to values:
# update_in(report.owner.name, &("Mr. " <> &1))

# Nested Accessors limited, because they are macros
# - The number of keys you pass a particular call is static.
# - You can't pass the set of keys as paramsters between funcs.

# 4. tricks with get_and_update_in and passing function istead of key_name 

