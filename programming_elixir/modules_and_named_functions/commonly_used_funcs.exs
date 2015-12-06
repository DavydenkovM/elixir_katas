defmodule CommonlyUsedFuncs do
  def float_to_string(number) do
    IO.puts Float.to_string(number, [decimals: 2, compact: true])
  end

  def get_env do
    System.put_env("ENV1", "sample_env_value")
    IO.puts System.get_env("ENV1")
  end

  def extname(path) do
    IO.puts Path.extname(path)
  end

  def pwd do
    IO.puts elem(File.cwd, 1)
  end

  def try_cmd do
    IO.puts elem(System.cmd("ls", ["-l"]), 0)
    IO.puts elem(System.cmd("echo", ["hello"]), 0)
  end
end

# 1
CommonlyUsedFuncs.float_to_string(3.14)
CommonlyUsedFuncs.float_to_string(3.145)
CommonlyUsedFuncs.float_to_string(3.105)

# 2
CommonlyUsedFuncs.get_env

# 3
CommonlyUsedFuncs.extname("~/dotfiles/.tmux.conf")

# 4
CommonlyUsedFuncs.pwd

# 5
CommonlyUsedFuncs.try_cmd
