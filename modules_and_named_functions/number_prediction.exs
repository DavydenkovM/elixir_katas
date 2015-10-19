defmodule NumberPrediction do
  def guess(number, lower..upper) do
    current_number = div(lower + upper, 2)
    IO.puts "Is it #{current_number}?"
    _guess(number, lower..upper, current_number)
  end

  defp _guess(number, lower..upper, current_number) when number > current_number do
    guess(number, current_number..upper)
  end

  defp _guess(number, lower..upper, current_number) when number < current_number do
    guess(number, lower..current_number)
  end

  defp _guess(_, _, number) do
    IO.puts "It is #{number}!"
  end
end

NumberPrediction.guess(273, 1..1000)
