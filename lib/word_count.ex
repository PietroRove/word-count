defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
      |> String.downcase()
      |> String.split(~r/[^[:alnum:]-]/u, trim: true)
      |> count_words
  end

  def count_words(word_list) do
    word_list
    |> Enum.reduce(%{}, fn w, map -> Map.update(map, w, 1, fn x -> x + 1 end) end)
  end

end
