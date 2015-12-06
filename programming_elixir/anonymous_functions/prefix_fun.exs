prefix = fn prefix_name ->
  fn string ->
    "#{prefix_name} #{string}"
  end
end

mrs = prefix.("Mrs")

IO.puts mrs.("Smith")
