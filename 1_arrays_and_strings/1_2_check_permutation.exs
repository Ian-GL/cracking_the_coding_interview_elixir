# Given two strings, write a method to decide if one is a permutation of the other

defmodule CheckPermutation do

  def is_permutation?(first_string, second_string) do
    if String.length(first_string) != String.length(second_string) do
      false
    else
      first_string = lower_and_sort(first_string)
      second_string = lower_and_sort(second_string)

      first_string == second_string
    end
  end

  defp lower_and_sort(string) do
    string
      |> String.downcase()
      |> String.graphemes()
      |> Enum.sort()
      |> Enum.join()
  end

end

CheckPermutation.is_permutation?("iamlordvoldemort", "tommarvoloriddle") |> IO.inspect() #true
CheckPermutation.is_permutation?("thisisnot", "ananagram") |> IO.inspect() #false
