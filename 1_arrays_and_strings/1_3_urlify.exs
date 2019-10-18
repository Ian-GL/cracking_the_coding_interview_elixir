# Write a method to replace all spaces in a string with '%20'. You may assume
# that the string has sufficient space at the end to hold the additional
# characters, and that you are given the "true" length of the string. (Note: If
# implementing in Java, please use a character array so that you can perform
# this operation in place)

defmodule Urlifier do
  def urlify(string, true_length) do
    string
    |> String.graphemes()
    |> Enum.reduce_while({0, true_length, ""}, &replace_space/2)
    |> elem(2)
  end

  defp replace_space(char, {count, max, str_acc} = acc) do
    cond do
      count >= max ->
        {:halt, acc}
      char == " " ->
        {:cont, {count + 1, max, str_acc <> "%20"}}
      true ->
        {:cont, {count + 1, max, str_acc <> char}}
    end
  end
end

Urlifier.urlify("Mr John Smith     ", 13) |> IO.inspect() # => "Mr%20John%20Smith"
