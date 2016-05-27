defmodule ControlFlow do
  defmacro unless(expression, do: block) do
    quote do
      if !unquote(expression), do: unquote(block)
    end
  end
end

# USAGE
# import ControlFlow
# ControlFlow.unless 2 == 5, do: IO.inspect "block entered"
# ControlFlow.unless 3 == 3, do: IO.inspect "block ignored"

# number = 5

# ast = quote do
#   number * 10
# end

# IO.inspect Code.eval_quoted(ast)

# ast = quote do
#   unquote(number) * 10
# end

# IO.inspect Code.eval_quoted(ast)
