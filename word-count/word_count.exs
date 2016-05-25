defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    %{} |> do_count(
      String.split(
        String.downcase(sentence),
        ~r/[^[:alpha:]0-9\-]+/iu)
        )
  end

  defp do_count(acc, [""|tail]) do
    acc |> do_count(tail)
  end

  defp do_count(acc, [head|tail]) do
    acc
      |> Map.put(head, update_word_count(acc, head))
      |> do_count(tail)
  end

  defp do_count(acc, []), do: acc

  def update_word_count(acc, word) when word != "" do
    Map.get(acc, word, 0) + 1
  end
end
