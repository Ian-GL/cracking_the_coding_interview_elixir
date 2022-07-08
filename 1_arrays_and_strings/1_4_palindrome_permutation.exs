# Given a string, write a function to check if it is a permutation of a
# palindrome. A palindrome is a word or phrase that is the same forwards and
# backwards. A permutation is a rearrangement of letters. The palindrome does
# not need to be limited to just dictionary words.

# All graphems need to come in pair except one

defmodule PalindromePermutation do
  def is_palindrome_permutation?(string) do
    string
    |> String.downcase()
    |> String.replace(" ", "")
    |> String.graphemes()
    |> Enum.reduce({%{}, 0}, fn char, acc -> palindrome_reducer(char, acc) end)
    |> elem(1)
    |> Kernel.<(2)
  end

  def palindrome_reducer(char, {map_acc, odd_count}) do
    new_map = Map.update(map_acc, char, 1, &(&1 +1))

    is_odd = rem(new_map[char], 2) != 0

    new_odd_count =
      if is_odd do
        odd_count + 1
      else
        odd_count - 1
      end

    {new_map, new_odd_count}
  end
end

PalindromePermutation.is_palindrome_permutation?("Tact Coa") |> IO.inspect() # true
PalindromePermutation.is_palindrome_permutation?("TT") |> IO.inspect() # true
PalindromePermutation.is_palindrome_permutation?("TT      ") |> IO.inspect() # true
PalindromePermutation.is_palindrome_permutation?("anita lava la tina") |> IO.inspect() # true
PalindromePermutation.is_palindrome_permutation?("pepe garnachas") |> IO.inspect() # false
