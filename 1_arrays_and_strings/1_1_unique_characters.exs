# Implement an algorithm to determine if a string has all unique characters.
# What if you cannot use additional data structures?

defmodule UniqueCharacters do

  # Unique characters using hash map
  def has_only_unique_characters_map?(string) do
    reduced_map =
      string
      |> String.graphemes()
      |> Enum.reduce_while(%{}, fn char, acc -> check_duplicates(char, acc) end)

    case reduced_map do
      :duplicate_char -> false
      _ -> true
    end
  end

  defp check_duplicates(char, acc) do
    if is_nil(acc[char]) do
      acc = Map.put_new(acc, char, 1)
      {:cont, acc}
    else
      {:halt, :duplicate_char}
    end
  end

  # Unique characters without additional data structures

  def has_only_unique_characters?(""), do: true

  def has_only_unique_characters?(string) do
    {char_to_compare, rest_of_str} = String.next_grapheme(string)

    if String.contains?(rest_of_str, char_to_compare) do
      false
    else
      has_only_unique_characters?(rest_of_str)
    end
  end
end

UniqueCharacters.has_only_unique_characters_map?("abcdef") |> IO.inspect() # => true
UniqueCharacters.has_only_unique_characters_map?("abcdbf") |> IO.inspect() # => false

UniqueCharacters.has_only_unique_characters?("abcdef") |> IO.inspect() # => true
UniqueCharacters.has_only_unique_characters?("abcdbf") |> IO.inspect() # => false
